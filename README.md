# Klinik-Arastirma-Deney-Takip-Sistemi

Üniversite projesi için Klinik Araştırma ve Deney Takip Sistemi. Bu proje; klinik araştırmaların, hasta gönüllü kayıtlarının, ilaç dozajlarının, güvenlik sınırlarının (doz aşımları) ve advers reaksiyonların (yan etkiler) veri tabanı ile düzenli bir şekilde takip edilebilmesini sağlayan bir yazılım sistemidir. Sistemin temel amacı; klinik deney süreçlerini tek bir merkezden, güvenilir ve ilişkisel bir veri tabanı altyapısıyla yönetmektir.

### Temel Özellikler
* Yürütülen klinik deneyleri, faz aşamalarını ve sorumlu hekimleri takip etme
* Gönüllü/hasta kabul süreçlerini, boy-kilo ve alerji bilgilerini kayıt altına alma
* Doz uygulama takvimi ve güvenli tavan dozu aşan durumları otomatik raporlama
* Kritik yan etki bildirimleri ve tedaviyi durdurma süreçlerini izleme
* SQL Server üzerinde dinamik veri ekleme, silme, güncelleme ve ilişkisel sorgulama işlemleri

---

### Proje Dosyaları
* **create_tables.sql:** Veritabanı tablolarının iskeletini, birincil anahtarlarını (PK) ve yabancı anahtar (FK) ilişkilerini oluşturan SQL kodları.
* **insert_data.sql:** Tabloları dolduran 100'den fazla gerçekçi klinik örnek veri seti (Hastalar, hekimler, ilaçlar, deneyler, dozlar ve yan etkiler).
* **queries.sql:** Klinik süreçleri analiz eden çoklu JOIN, filtreleme ve gruplama (GROUP BY) sorguları.

---

### Veritabanı Tablo Yapısı (8 Ana Tablo)

1. **Hastalar:** Deneye dahil edilen gönüllülerin kimlik, yaş, kilo, cinsiyet, kan grubu ve alerji geçmişini tutar.
2. **Doktorlar:** Araştırmayı ve klinik deney protokollerini yürüten sorumlu hekimlerin unvan ve uzmanlık bilgilerini tanımlar.
3. **Ilaclar:** Deney aşamasındaki molekülleri, etken maddeleri, standart günlük dozajı ve maksimum güvenli doz tavan sınırını tutar.
4. **KlinikDeneyler:** Hangi ilacın hangi fazda (Faz 1, Faz 2, Faz 3), hangi tarihlerde ve hangi hekim sorumluluğunda yürütüldüğünü kaydeder.
5. **HastaDeneyKayitlari:** Gönüllü hastaların hangi klinik araştırmaya dahil edildiğini ve aktiflik durumunu eşleştiren ara tablodur.
6. **IlacDozlari:** Hastalara uygulanan fiili doz miktarını (mg), uygulama zamanını ve dozu veren sağlık personelini tutar.
7. **DozAsimlari:** Verilen dozun ilacın maksimum güvenli sınırını aşması durumunda tetiklenen aşım miktarını ve acil tıbbi müdahale notlarını takip eder.
8. **YanEtkilerVeTepkiler:** Doz sonrası hastalarda gelişen semptomları, ciddiyet seviyesini (Hafif, Orta, Kritik) ve ilacın durdurulma kararını belgeler.
