USE KlinikArastirmaDB;
GO

-- 1. HASTALAR (Gerçekçi yaş, kilo ve tıbbi geçmiş)
INSERT INTO Hastalar (Ad, Soyad, Yas, Kilo, Cinsiyet, KanGrubu, Alerjiler) VALUES
('Ahmet', 'Yılmaz', 48, 78.50, 'E', 'A Rh+', 'Penisilin'),
('Ayşe', 'Kaya', 54, 64.20, 'K', '0 Rh+', 'Yok'),
('Mehmet', 'Demir', 62, 85.00, 'E', 'B Rh+', 'Aspirin, Sülfonamid'),
('Fatma', 'Çelik', 41, 58.70, 'K', 'AB Rh-', 'Yok'),
('Mustafa', 'Öztürk', 59, 92.10, 'E', '0 Rh-', 'İyotlu Kontrast Madde'),
('Zeynep', 'Arslan', 36, 55.40, 'K', 'A Rh-', 'Lateks'),
('Emre', 'Koç', 45, 81.30, 'E', 'B Rh-', 'Yok'),
('Elif', 'Şahin', 50, 68.00, 'K', 'A Rh+', 'NSAİİ (Ağrı Kesiciler)');
GO

-- 2. DOKTORLAR (Klinik Araştırmacı Hekimler)
INSERT INTO Doktorlar (Ad, Soyad, Unvan, UzmanlikAlani, Telefon) VALUES
('Kemal', 'Sunal', 'Prof. Dr.', 'Tıbbi Onkoloji', '05321112233'),
('Canan', 'Dağdeviren', 'Doç. Dr.', 'Klinik Farmakoloji', '05332223344'),
('Mehmet', 'Öz', 'Prof. Dr.', 'Kardiyoloji', '05343334455'),
('Gülse', 'Birsel', 'Uzm. Dr.', 'Göğüs Hastalıkları', '05354445566'),
('Aziz', 'Sancar', 'Prof. Dr.', 'Moleküler Biyoloji ve Biyokimya', '05365556677');
GO

-- 3. İLAÇLAR (Gerçek Klinik Moleküller ve Doz Sınırları)
INSERT INTO Ilaclar (IlacAdi, EtkenMadde, StandartDozMG, MaksimumGuvenliDozMG) VALUES
('OncoFree-X', 'Pembrolizumab', 200.00, 400.00),     -- İmmünoterapi (Kanser)
('CardioPulse', 'Metoprolol Süksinat', 50.00, 200.00), -- Beta Bloker (Tansiyon/Kalp)
('NeuroProtect', 'Riluzol', 50.00, 100.00),           -- Nörolojik Koruyucu
('DiabeShield', 'Metformin Hidroklorür', 850.00, 2550.00), -- Antidiyabetik
('RheumaStop', 'Adalimumab', 40.00, 80.00);           -- Biyolojik Ajan (Romatoloji)
GO

-- 4. KLİNİK DENEYLER (Faz Araştırmaları)
INSERT INTO KlinikDeneyler (IlacID, SorumluDoktorID, DeneyAdi, Faz, BaslangicTarihi, Durum) VALUES
(1, 1, 'İleri Evre Akciğer Kanserinde Pembrolizumab Etkinliği', 'Faz 2', '2026-01-15', 'Devam Ediyor'),
(2, 3, 'Dirençli Hipertansiyonda Yeni Nesil Salımlı Metoprolol', 'Faz 3', '2025-11-01', 'Devam Ediyor'),
(3, 2, 'Erken Evre Nörodejeneratif İlerlemeyi Yavaşlatma Deneyi', 'Faz 1', '2026-03-10', 'Devam Ediyor'),
(4, 4, 'Tip-2 Diyabette Kombine Metformin Tedavisi', 'Faz 3', '2025-08-20', 'Tamamlandı');
GO

-- 5. HASTA DENEY KAYITLARI (Gönüllülerin Çalışmalara Kabulleri)
INSERT INTO HastaDeneyKayitlari (DeneyID, HastaID, BaslangicTarihi, Durum) VALUES
(1, 1, '2026-01-20', 'Aktif'),
(1, 2, '2026-01-22', 'Aktif'),
(2, 3, '2025-11-05', 'Aktif'),
(2, 5, '2025-11-10', 'Doz Durduruldu'), -- Yan etki / aşım nedeniyle durdurulacak hasta
(3, 4, '2026-03-15', 'Aktif'),
(3, 6, '2026-03-18', 'Aktif'),
(4, 7, '2025-08-25', 'Tamamlandı'),
(4, 8, '2025-08-26', 'Tamamlandı');
GO

-- 6. İLAÇ DOZLARI (Uygulanan Dozaj Kayıtları)
INSERT INTO IlacDozlari (KayitID, VerilenDozMG, VerilmeZamani, UygulayanPersonel) VALUES
(1, 200.00, '2026-02-01 09:30:00', 'Hemşire Selin Ak'),
(1, 200.00, '2026-02-15 09:15:00', 'Hemşire Selin Ak'),
(2, 200.00, '2026-02-02 10:00:00', 'Hemşire Gizem Yurt'),
(3, 50.00,  '2025-11-15 08:30:00', 'Hemşire Selin Ak'),
(4, 250.00, '2025-11-20 14:00:00', 'Hemşire Hakan Bal'), -- DİKKAT: Metoprolol maks sınırı 200mg idi! (AŞIM YAPILDI)
(5, 50.00,  '2026-03-20 11:00:00', 'Hemşire Gizem Yurt'),
(6, 120.00, '2026-03-22 10:30:00', 'Hemşire Hakan Bal'); -- DİKKAT: Riluzol maks sınırı 100mg idi! (AŞIM YAPILDI)
GO

-- 7. DOZ AŞIMLARI (Güvenlik sınırını aşan uygulamaların takibi)
INSERT INTO DozAsimlari (DozTakipID, AsimMiktariMG, MudahaleEdildiMi, MudahaleNotu) VALUES
(5, 50.00, 1, 'Hasta monitörize edildi. IV sıvı desteği ve atropin hazırlandı. Doz hemen kesildi.'),
(7, 20.00, 1, 'Hafif bulantı gözlendi, karaciğer enzimleri kontrol edildi. Doz protokolü askıya alındı.');
GO

-- 8. YAN ETKİLER VE TEPKİLER
INSERT INTO YanEtkilerVeTepkiler (DozTakipID, Belirti, CiddiyetSeviyesi, DozDurdurulduMu) VALUES
(5, 'Şiddetli Bradikardi ve Baş Dönmesi', 'Kritik', 1),
(7, 'Akut Karaciğer Enzim Yüksekliği (ALT/AST)', 'Orta', 1),
(1, 'Hafif Cilt Döküntüsü ve Halsizlik', 'Hafif', 0),
(3, 'Sabah Baş Ağrısı', 'Hafif', 0);
GO