USE KlinikArastirmaDB;
GO

-- Eğer bu isimlerde tekrar tablo olusturmak istenirse kırmızı hata verilir 
IF OBJECT_ID('YanEtkilerVeTepkiler', 'U') IS NOT NULL DROP TABLE YanEtkilerVeTepkiler;
IF OBJECT_ID('DozAsimlari', 'U') IS NOT NULL DROP TABLE DozAsimlari;
IF OBJECT_ID('IlacDozlari', 'U') IS NOT NULL DROP TABLE IlacDozlari;
IF OBJECT_ID('HastaDeneyKayitlari', 'U') IS NOT NULL DROP TABLE HastaDeneyKayitlari;
IF OBJECT_ID('KlinikDeneyler', 'U') IS NOT NULL DROP TABLE KlinikDeneyler;
IF OBJECT_ID('Ilaclar', 'U') IS NOT NULL DROP TABLE Ilaclar;
IF OBJECT_ID('Doktorlar', 'U') IS NOT NULL DROP TABLE Doktorlar;
IF OBJECT_ID('Hastalar', 'U') IS NOT NULL DROP TABLE Hastalar;
GO

CREATE TABLE Hastalar (
    HastaID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Yas INT NOT NULL,
    Kilo DECIMAL(5,2) NOT NULL, -- Doz hesabı için kilo kritik
    Cinsiyet NVARCHAR(10) NOT NULL,
    KanGrubu NVARCHAR(10) NULL,
    Alerjiler NVARCHAR(200) NULL
);
GO

CREATE TABLE Doktorlar (
    DoktorID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Unvan NVARCHAR(50) NOT NULL,
    UzmanlikAlani NVARCHAR(100) NOT NULL,
    Telefon VARCHAR(20) NULL
);
GO

-- 3. Tablo: İlaçlar (Maksimum Doz Sınırları Dahil)
CREATE TABLE Ilaclar (
    IlacID INT IDENTITY(1,1) PRIMARY KEY,
    IlacAdi NVARCHAR(100) NOT NULL,
    EtkenMadde NVARCHAR(100) NOT NULL,
    StandartDozMG DECIMAL(8,2) NOT NULL,     -- Normal önerilen günlük doz (mg)
    MaksimumGuvenliDozMG DECIMAL(8,2) NOT NULL -- Aşım uyarısı için tavan sınır (mg)
);
GO

CREATE TABLE KlinikDeneyler (
    DeneyID INT IDENTITY(1,1) PRIMARY KEY,
    IlacID INT NOT NULL,
    SorumluDoktorID INT NOT NULL,
    DeneyAdi NVARCHAR(150) NOT NULL,
    Faz NVARCHAR(20) NOT NULL, -- Faz 1, Faz 2, Faz 3
    BaslangicTarihi DATE NOT NULL,
    Durum NVARCHAR(30) NOT NULL DEFAULT 'Devam Ediyor',
    CONSTRAINT FK_Deney_Ilac FOREIGN KEY (IlacID) REFERENCES Ilaclar(IlacID),
    CONSTRAINT FK_Deney_Doktor FOREIGN KEY (SorumluDoktorID) REFERENCES Doktorlar(DoktorID)
);
GO

CREATE TABLE HastaDeneyKayitlari (
    KayitID INT IDENTITY(1,1) PRIMARY KEY,
    DeneyID INT NOT NULL,
    HastaID INT NOT NULL,
    BaslangicTarihi DATE NOT NULL,
    Durum NVARCHAR(30) NOT NULL DEFAULT 'Aktif', -- Aktif, Tamamlandı, Doz Durduruldu
    CONSTRAINT FK_Kayit_Deney FOREIGN KEY (DeneyID) REFERENCES KlinikDeneyler(DeneyID),
    CONSTRAINT FK_Kayit_Hasta FOREIGN KEY (HastaID) REFERENCES Hastalar(HastaID)
);
GO

-- 6. Tablo: İlaç Dozları (Uygulanan Doz Takibi)
CREATE TABLE IlacDozlari (
    DozTakipID INT IDENTITY(1,1) PRIMARY KEY,
    KayitID INT NOT NULL,
    VerilenDozMG DECIMAL(8,2) NOT NULL,
    VerilmeZamani DATETIME NOT NULL,
    UygulayanPersonel NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Doz_Kayit FOREIGN KEY (KayitID) REFERENCES HastaDeneyKayitlari(KayitID)
);
GO

-- 7. Tablo: Doz Aşımları (Sınır Aşıldığında Düşen Kayıtlar)
CREATE TABLE DozAsimlari (
    AsimID INT IDENTITY(1,1) PRIMARY KEY,
    DozTakipID INT NOT NULL,
    AsimMiktariMG DECIMAL(8,2) NOT NULL,
    TespitTarihi DATETIME DEFAULT GETDATE(),
    MudahaleEdildiMi BIT NOT NULL DEFAULT 0, -- 0: Hayır, 1: Evet
    MudahaleNotu NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Asim_Doz FOREIGN KEY (DozTakipID) REFERENCES IlacDozlari(DozTakipID)
);
GO


CREATE TABLE YanEtkilerVeTepkiler (
    YanEtkiID INT IDENTITY(1,1) PRIMARY KEY,
    DozTakipID INT NOT NULL,
    Belirti NVARCHAR(150) NOT NULL,
    CiddiyetSeviyesi NVARCHAR(20) NOT NULL CHECK (CiddiyetSeviyesi IN ('Hafif', 'Orta', 'Kritik')),
    DozDurdurulduMu BIT NOT NULL DEFAULT 0, -- Kritikse dozu kesme takibi
    RaporTarihi DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_YanEtki_Doz FOREIGN KEY (DozTakipID) REFERENCES IlacDozlari(DozTakipID)
);
GO