USE KlinikArastirmaDB;
GO

-- Eski verileri ilişkisel sıraya göre temizleme ve ID sayaçlarını sıfırlama
DELETE FROM YanEtkilerVeTepkiler;
DELETE FROM DozAsimlari;
DELETE FROM IlacDozlari;
DELETE FROM HastaDeneyKayitlari;
DELETE FROM KlinikDeneyler;
DELETE FROM Ilaclar;
DELETE FROM Doktorlar;
DELETE FROM Hastalar;

DBCC CHECKIDENT ('YanEtkilerVeTepkiler', RESEED, 0);
DBCC CHECKIDENT ('DozAsimlari', RESEED, 0);
DBCC CHECKIDENT ('IlacDozlari', RESEED, 0);
DBCC CHECKIDENT ('HastaDeneyKayitlari', RESEED, 0);
DBCC CHECKIDENT ('KlinikDeneyler', RESEED, 0);
DBCC CHECKIDENT ('Ilaclar', RESEED, 0);
DBCC CHECKIDENT ('Doktorlar', RESEED, 0);
DBCC CHECKIDENT ('Hastalar', RESEED, 0);
GO

-- 1. HASTALAR (30 Kayıt)
INSERT INTO Hastalar (Ad, Soyad, Yas, Kilo, Cinsiyet, KanGrubu, Alerjiler) VALUES
('Ahmet', 'Yılmaz', 48, 78.50, 'E', 'A Rh+', 'Penisilin'),
('Ayşe', 'Kaya', 54, 64.20, 'K', '0 Rh+', 'Yok'),
('Mehmet', 'Demir', 62, 85.00, 'E', 'B Rh+', 'Aspirin, Sülfonamid'),
('Fatma', 'Çelik', 41, 58.70, 'K', 'AB Rh-', 'Yok'),
('Mustafa', 'Öztürk', 59, 92.10, 'E', '0 Rh-', 'İyotlu Kontrast Madde'),
('Zeynep', 'Arslan', 36, 55.40, 'K', 'A Rh-', 'Lateks'),
('Emre', 'Koç', 45, 81.30, 'E', 'B Rh-', 'Yok'),
('Elif', 'Şahin', 50, 68.00, 'K', 'A Rh+', 'NSAİİ (Ağrı Kesiciler)'),
('Burak', 'Yıldız', 29, 74.00, 'E', '0 Rh+', 'Yok'),
('Seda', 'Aydın', 43, 61.50, 'K', 'B Rh+', 'Polen, Toz'),
('Murat', 'Güler', 67, 88.20, 'E', 'A Rh+', 'Siprofloksasin'),
('Hülya', 'Aksoy', 38, 59.00, 'K', 'AB Rh+', 'Yok'),
('Serkan', 'Özdemir', 52, 83.40, 'E', '0 Rh+', 'Morfin türevleri'),
('Büşra', 'Polat', 31, 52.80, 'K', 'A Rh-', 'Yok'),
('Deniz', 'Kurt', 47, 76.20, 'E', 'B Rh+', 'Fıstık'),
('Ece', 'Bulut', 55, 69.30, 'K', '0 Rh-', 'Penisilin'),
('Ali', 'Yalçın', 64, 91.00, 'E', 'A Rh+', 'Yok'),
('Merve', 'Kılıç', 33, 56.10, 'K', 'B Rh-', 'Yok'),
('Kemal', 'Aslan', 58, 84.70, 'E', 'AB Rh+', 'ACE İnhibitörleri'),
('Derya', 'Güneş', 46, 63.80, 'K', '0 Rh+', 'Yok'),
('Cem', 'Turan', 39, 79.50, 'E', 'A Rh-', 'Yok'),
('Özlem', 'Erdoğan', 61, 71.20, 'K', 'B Rh+', 'Yok'),
('Hakan', 'Çetin', 53, 86.40, 'E', '0 Rh+', 'Sülfitler'),
('Gamze', 'Bozkurt', 27, 54.00, 'K', 'A Rh+', 'Yok'),
('Tolga', 'Avcı', 49, 82.00, 'E', 'AB Rh-', 'Yok'),
('Sevgi', 'Karaca', 57, 67.50, 'K', '0 Rh-', 'Beta Bloker'),
('Onur', 'Taş', 44, 77.80, 'E', 'B Rh+', 'Yok'),
('Ebru', 'Yavuz', 35, 58.20, 'K', 'A Rh+', 'Yok'),
('Volkan', 'Gök', 63, 89.60, 'E', '0 Rh+', 'Kortizon'),
('Gizem', 'Coşkun', 40, 62.00, 'K', 'AB Rh+', 'Yok');
GO

-- 2. DOKTORLAR (10 Kayıt)
INSERT INTO Doktorlar (Ad, Soyad, Unvan, UzmanlikAlani, Telefon) VALUES
('Kemal', 'Sunal', 'Prof. Dr.', 'Tıbbi Onkoloji', '05321112233'),
('Canan', 'Dağdeviren', 'Doç. Dr.', 'Klinik Farmakoloji', '05332223344'),
('Mehmet', 'Öz', 'Prof. Dr.', 'Kardiyoloji', '05343334455'),
('Gülse', 'Birsel', 'Uzm. Dr.', 'Göğüs Hastalıkları', '05354445566'),
('Aziz', 'Sancar', 'Prof. Dr.', 'Moleküler Biyoloji ve Biyokimya', '05365556677'),
('Türkan', 'Saylan', 'Prof. Dr.', 'Dermatoloji ve Enfeksiyon', '05376667788'),
('Gazi', 'Yaşargil', 'Prof. Dr.', 'Beyin ve Sinir Cerrahisi', '05387778899'),
('Ahmet', 'Rasim', 'Doç. Dr.', 'İç Hastalıkları', '05398889900'),
('İlknur', 'Kaya', 'Uzm. Dr.', 'Nöroloji', '05301234567'),
('Oğuz', 'Baran', 'Uzm. Dr.', 'Hematoloji', '05319876543');
GO

-- 3. İLAÇLAR (10 Kayıt)
INSERT INTO Ilaclar (IlacAdi, EtkenMadde, StandartDozMG, MaksimumGuvenliDozMG) VALUES
('OncoFree-X', 'Pembrolizumab', 200.00, 400.00),
('CardioPulse', 'Metoprolol Süksinat', 50.00, 200.00),
('NeuroProtect', 'Riluzol', 50.00, 100.00),
('DiabeShield', 'Metformin Hidroklorür', 850.00, 2550.00),
('RheumaStop', 'Adalimumab', 40.00, 80.00),
('PulmoClear', 'Salmeterol / Flutikazon', 50.00, 100.00),
('VasoTens', 'Amlodipin Besilat', 5.00, 10.00),
('LeukoTarget', 'İmatinib Mesilat', 400.00, 800.00),
('ImmunoMod', 'Takrolimus', 2.00, 5.00),
('CephaloZil', 'Sefotaksim Sodyum', 1000.00, 4000.00);
GO

-- 4. KLİNİK DENEYLER (10 Kayıt)
INSERT INTO KlinikDeneyler (IlacID, SorumluDoktorID, DeneyAdi, Faz, BaslangicTarihi, Durum) VALUES
(1, 1, 'İleri Evre Akciğer Kanserinde Pembrolizumab Etkinliği', 'Faz 2', '2026-01-15', 'Devam Ediyor'),
(2, 3, 'Dirençli Hipertansiyonda Yeni Nesil Salımlı Metoprolol', 'Faz 3', '2025-11-01', 'Devam Ediyor'),
(3, 9, 'Erken Evre ALS Hastalarında Nöroprotektif Riluzol Analizi', 'Faz 1', '2026-03-10', 'Devam Ediyor'),
(4, 8, 'Tip-2 Diyabetik Obez Hastalarda Kombine Metformin Tedavisi', 'Faz 3', '2025-08-20', 'Tamamlandı'),
(5, 2, 'Romatoid Artritte Adalimumab Doz Escalation Protokolü', 'Faz 2', '2026-02-01', 'Devam Ediyor'),
(6, 4, 'Kronik Astım Hastalarında Salmeterol Güvenlik Taraması', 'Faz 3', '2025-12-10', 'Devam Ediyor'),
(7, 3, 'Geriatrik Popülasyonda Amlodipin Hipotansif İzlemi', 'Faz 4', '2025-09-01', 'Tamamlandı'),
(8, 10, 'Kronik Miyeloid Lösemide İmatinib Doz Güvenliği', 'Faz 2', '2026-01-05', 'Devam Ediyor'),
(9, 5, 'Organ Nakli Sonrası Takrolimus Toksisite Eşik Analizi', 'Faz 1', '2026-04-01', 'Devam Ediyor'),
(10, 6, 'Dirençli Bakteriyel Enfeksiyonlarda Yüksek Doz Sefotaksim', 'Faz 2', '2026-02-15', 'Devam Ediyor');
GO

-- 5. HASTA DENEY KAYITLARI (35 Kayıt)
INSERT INTO HastaDeneyKayitlari (DeneyID, HastaID, BaslangicTarihi, Durum) VALUES
(1, 1, '2026-01-20', 'Aktif'),
(1, 2, '2026-01-22', 'Aktif'),
(1, 3, '2026-01-25', 'Aktif'),
(2, 4, '2025-11-05', 'Aktif'),
(2, 5, '2025-11-10', 'Doz Durduruldu'),
(2, 6, '2025-11-12', 'Aktif'),
(2, 7, '2025-11-15', 'Aktif'),
(3, 8, '2026-03-15', 'Aktif'),
(3, 9, '2026-03-18', 'Doz Durduruldu'),
(3, 10, '2026-03-20', 'Aktif'),
(4, 11, '2025-08-25', 'Tamamlandı'),
(4, 12, '2025-08-26', 'Tamamlandı'),
(4, 13, '2025-08-30', 'Tamamlandı'),
(5, 14, '2026-02-05', 'Aktif'),
(5, 15, '2026-02-07', 'Doz Durduruldu'),
(5, 16, '2026-02-10', 'Aktif'),
(6, 17, '2025-12-15', 'Aktif'),
(6, 18, '2025-12-18', 'Aktif'),
(6, 19, '2025-12-20', 'Doz Durduruldu'),
(7, 20, '2025-09-05', 'Tamamlandı'),
(7, 21, '2025-09-08', 'Tamamlandı'),
(8, 22, '2026-01-10', 'Aktif'),
(8, 23, '2026-01-12', 'Aktif'),
(8, 24, '2026-01-15', 'Doz Durduruldu'),
(9, 25, '2026-04-05', 'Aktif'),
(9, 26, '2026-04-08', 'Doz Durduruldu'),
(10, 27, '2026-02-20', 'Aktif'),
(10, 28, '2026-02-22', 'Aktif'),
(10, 29, '2026-02-25', 'Doz Durduruldu'),
(1, 30, '2026-02-01', 'Aktif'),
(2, 1, '2026-04-10', 'Aktif'),
(3, 2, '2026-04-12', 'Aktif'),
(4, 3, '2025-09-15', 'Tamamlandı'),
(5, 4, '2026-04-15', 'Aktif'),
(6, 5, '2026-04-18', 'Aktif');
GO

-- 6. İLAÇ DOZLARI (40 Kayıt)
INSERT INTO IlacDozlari (KayitID, VerilenDozMG, VerilmeZamani, UygulayanPersonel) VALUES
(1, 200.00, '2026-02-01 09:30:00', 'Hemşire Selin Ak'),
(1, 200.00, '2026-02-15 09:15:00', 'Hemşire Selin Ak'),
(2, 200.00, '2026-02-02 10:00:00', 'Hemşire Gizem Yurt'),
(3, 450.00, '2026-02-05 11:30:00', 'Hemşire Hakan Bal'),   -- AŞIM: Pembrolizumab maks 400mg
(4, 50.00,  '2025-11-15 08:30:00', 'Hemşire Selin Ak'),
(5, 250.00, '2025-11-20 14:00:00', 'Hemşire Hakan Bal'),   -- AŞIM: Metoprolol maks 200mg
(6, 50.00,  '2025-11-22 09:00:00', 'Hemşire Gizem Yurt'),
(7, 50.00,  '2025-11-25 09:30:00', 'Hemşire Gizem Yurt'),
(8, 50.00,  '2026-03-20 11:00:00', 'Hemşire Selin Ak'),
(9, 130.00, '2026-03-22 10:30:00', 'Hemşire Hakan Bal'),   -- AŞIM: Riluzol maks 100mg
(10, 50.00, '2026-03-25 10:00:00', 'Hemşire Selin Ak'),
(11, 850.00, '2025-09-01 08:00:00', 'Hemşire Gizem Yurt'),
(12, 850.00, '2025-09-01 08:15:00', 'Hemşire Gizem Yurt'),
(13, 2800.00, '2025-09-05 12:00:00', 'Hemşire Hakan Bal'), -- AŞIM: Metformin maks 2550mg
(14, 40.00, '2026-02-10 13:00:00', 'Hemşire Selin Ak'),
(15, 100.00, '2026-02-12 15:30:00', 'Hemşire Hakan Bal'),  -- AŞIM: Adalimumab maks 80mg
(16, 40.00, '2026-02-15 13:30:00', 'Hemşire Gizem Yurt'),
(17, 50.00, '2025-12-20 09:00:00', 'Hemşire Selin Ak'),
(18, 50.00, '2025-12-22 09:30:00', 'Hemşire Selin Ak'),
(19, 125.00, '2025-12-25 10:15:00', 'Hemşire Hakan Bal'),  -- AŞIM: Salmeterol maks 100mg
(20, 5.00,  '2025-09-10 08:30:00', 'Hemşire Gizem Yurt'),
(21, 15.00, '2025-09-12 09:00:00', 'Hemşire Hakan Bal'),   -- AŞIM: Amlodipin maks 10mg
(22, 400.00, '2026-01-18 10:00:00', 'Hemşire Selin Ak'),
(23, 400.00, '2026-01-20 10:30:00', 'Hemşire Gizem Yurt'),
(24, 900.00, '2026-01-22 14:00:00', 'Hemşire Hakan Bal'),  -- AŞIM: İmatinib maks 800mg
(25, 2.00,  '2026-04-10 08:00:00', 'Hemşire Selin Ak'),
(26, 7.50,  '2026-04-12 08:30:00', 'Hemşire Hakan Bal'),   -- AŞIM: Takrolimus maks 5mg
(27, 1000.00, '2026-02-25 11:00:00', 'Hemşire Gizem Yurt'),
(28, 2000.00, '2026-02-27 11:30:00', 'Hemşire Selin Ak'),
(29, 5000.00, '2026-03-01 16:00:00', 'Hemşire Hakan Bal'), -- AŞIM: Sefotaksim maks 4000mg
(30, 200.00, '2026-02-10 10:00:00', 'Hemşire Selin Ak'),
(31, 50.00,  '2026-04-15 09:00:00', 'Hemşire Gizem Yurt'),
(32, 50.00,  '2026-04-16 09:30:00', 'Hemşire Selin Ak'),
(33, 850.00, '2025-09-20 08:30:00', 'Hemşire Gizem Yurt'),
(34, 40.00,  '2026-04-20 14:00:00', 'Hemşire Selin Ak'),
(35, 50.00,  '2026-04-22 09:00:00', 'Hemşire Hakan Bal'),
(1, 200.00,  '2026-03-01 09:30:00', 'Hemşire Selin Ak'),
(2, 420.00,  '2026-03-02 10:15:00', 'Hemşire Hakan Bal'),  -- AŞIM: Pembrolizumab maks 400mg
(4, 50.00,   '2025-12-01 08:30:00', 'Hemşire Selin Ak'),
(6, 220.00,  '2025-12-05 14:00:00', 'Hemşire Hakan Bal');  -- AŞIM: Metoprolol maks 200mg
GO

-- 7. DOZ AŞIMLARI (12 Kayıt)
INSERT INTO DozAsimlari (DozTakipID, AsimMiktariMG, MudahaleEdildiMi, MudahaleNotu) VALUES
(4, 50.00, 1, 'İnfüzyon hızı kesildi. Antihistaminik ve kortikosteroid tedavisi uygulandı.'),
(6, 50.00, 1, 'Hasta monitörize edildi. IV sıvı desteği ve atropin hazırlandı. Doz hemen kesildi.'),
(10, 30.00, 1, 'Akut bulantı ve baş dönmesi gözlendi. Karaciğer enzimleri takibe alındı.'),
(14, 250.00, 1, 'Laktik asidoz riski nedeniyle hidrasyon tedavisi başlatıldı.'),
(16, 20.00, 1, 'Lokal enjeksiyon reaksiyonu gelişti, topikal tedavi uygulandı.'),
(20, 25.00, 1, 'Taşikardi ve bronkospazm riski gözlendi, oksijen desteği verildi.'),
(22, 5.00, 1, 'Akut hipotansiyon gelişti, hasta Trendelenburg pozisyonuna alındı.'),
(25, 100.00, 1, 'Ciddi miyelosupresyon şüphesiyle kan transfüzyon hazırlığı yapıldı.'),
(27, 2.50, 1, 'Nefrotoksisite riski; serum takrolimus düzeyi saatlik takip ediliyor.'),
(30, 1000.00, 1, 'Böbrek klirensi kontrol edildi, diüretik tedavisi uygulandı.'),
(38, 20.00, 1, 'Hafif ateş yükselmesi izlendi, parasetamol verildi ve gözlem altına alındı.'),
(40, 20.00, 1, 'Bradikardi tablosu gelişti, EKG kontrolü yapıldı.');
GO

-- 8. YAN ETKİLER VE TEPKİLER (18 Kayıt)
INSERT INTO YanEtkilerVeTepkiler (DozTakipID, Belirti, CiddiyetSeviyesi, DozDurdurulduMu) VALUES
(6, 'Şiddetli Bradikardi ve Senkop (Bayılma)', 'Kritik', 1),
(10, 'Akut Karaciğer Enzim Yüksekliği (ALT/AST)', 'Orta', 1),
(1, 'Hafif Cilt Döküntüsü ve Kaşıntı', 'Hafif', 0),
(5, 'Hafif Baş Ağrısı ve Yorgunluk', 'Hafif', 0),
(4, 'Solunum Güçlüğü ve Anjiyoödem', 'Kritik', 1),
(14, 'Mide Krampları ve Şiddetli Diyare', 'Orta', 0),
(16, 'Enjeksiyon Bölgesinde Yaygın Eritem ve Ağrı', 'Hafif', 0),
(20, 'Titreme ve Çarpıntı', 'Orta', 1),
(22, 'Ortostatik Hipotansiyon ve Soğuk Terleme', 'Kritik', 1),
(25, 'Trombositopeni ve Burun Kanaması', 'Kritik', 1),
(27, 'Ellerde Şiddetli Tremor ve Serum Kreatinin Artışı', 'Kritik', 1),
(30, 'Ciltte Kızarıklık ve İlaca Bağlı Ateş', 'Orta', 1),
(2, 'Eklem Ağrısı (Artralji)', 'Hafif', 0),
(8, 'Kas Seyirmesi ve Yorgunluk', 'Hafif', 0),
(12, 'Hafif Dispepsi (Hazımsızlık)', 'Hafif', 0),
(18, 'Ağız Kuruluğu', 'Hafif', 0),
(28, 'Venöz Tahriş ve Flebit', 'Orta', 0),
(40, 'Halsizlik ve Göğüste Baskı Hissi', 'Orta', 1);
GO