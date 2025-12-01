-- 0️⃣ Veritabanını oluştur ve seç
CREATE DATABASE IF NOT EXISTS EtkinlikDB;
USE EtkinlikDB;

-- ##########################
-- 1️⃣ Foreign Key Kontrolleri
-- ##########################
SET FOREIGN_KEY_CHECKS = 0;

-- ##########################
-- 2️⃣ Varolan tabloları sil
-- ##########################
DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Cities;

SET FOREIGN_KEY_CHECKS = 1;

-- ##########################
-- 3️⃣ Tabloları oluştur
-- ##########################
CREATE TABLE Cities (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    population INT
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    city_id INT,
    category VARCHAR(50),
    date DATE,
    ticket_price DECIMAL(6,2),
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- ##########################
-- 4️⃣ Verileri ekle
-- ##########################
INSERT INTO Cities (city_name, country, population) VALUES
('İstanbul', 'Türkiye', 15519267),
('Ankara', 'Türkiye', 5639076),
('İzmir', 'Türkiye', 4424919),
('Bursa', 'Türkiye', 3056120),
('Antalya', 'Türkiye', 2610838),
('Adana', 'Türkiye', 2237940),
('Konya', 'Türkiye', 2267092),
('Gaziantep', 'Türkiye', 2143937),
('Kayseri', 'Türkiye', 1434505),
('Mersin', 'Türkiye', 1640556),
('Samsun', 'Türkiye', 1320000),
('Trabzon', 'Türkiye', 808000),
('Eskişehir', 'Türkiye', 887000),
('Diyarbakır', 'Türkiye', 1550000),
('Elazığ', 'Türkiye', 590000),
('Sakarya', 'Türkiye', 1070000),
('Malatya', 'Türkiye', 810000),
('Erzurum', 'Türkiye', 762000),
('Van', 'Türkiye', 1110000),
('Kocaeli', 'Türkiye', 1740000);

INSERT INTO Users (name, age, city_id) VALUES
('Merve', 21, 1),
('Melis', 23, 2),
('Mehmet', 25, 3),
('Murat', 28, 4),
('Mahmut', 30, 5),
('Mert', 22, 6),
('Melih', 27, 7),
('Mira', 24, 8),
('Mustafa', 26, 9),
('Münevver', 29, 10),
('Mahir', 32, 11),
('Maya', 20, 12),
('Mahircan', 31, 13),
('Müjde', 22, 14),
('Muratcan', 24, 15),
('Mecit', 35, 16),
('Minel', 28, 17),
('Mertcan', 27, 18),
('Melda', 23, 19),
('Mücahit', 30, 20);

INSERT INTO Events (event_name, city_id, category, date, ticket_price) VALUES
('Rock Fest', 1, 'Konser', '2025-12-15', 250.00),
('Jazz Night', 2, 'Konser', '2025-11-20', 180.00),
('Tiyatro Gösterisi', 3, 'Tiyatro', '2025-12-01', 120.00),
('Film Festivali', 4, 'Festival', '2025-12-10', 200.00),
('Klasik Müzik Gecesi', 5, 'Konser', '2025-11-25', 220.00),
('Halk Dansları', 6, 'Gösteri', '2025-12-05', 150.00),
('Stand-up Komedi', 7, 'Gösteri', '2025-11-28', 180.00),
('Rock Maraton', 8, 'Konser', '2025-12-12', 300.00),
('Çocuk Tiyatrosu', 9, 'Tiyatro', '2025-12-08', 100.00),
('Caz Festivali', 10, 'Festival', '2025-11-30', 250.00),
('Pop Konseri', 11, 'Konser', '2025-12-18', 200.00),
('Film Gösterimi', 12, 'Festival', '2025-12-20', 150.00),
('Modern Dans', 13, 'Gösteri', '2025-12-22', 180.00),
('Karaoke Gecesi', 14, 'Konser', '2025-12-25', 120.00),
('Tiyatro Maraton', 15, 'Tiyatro', '2025-12-28', 200.00),
('Caz Konseri', 16, 'Konser', '2025-12-30', 220.00),
('Halk Festivali', 17, 'Festival', '2025-11-26', 180.00),
('Stand-up Gösterisi', 18, 'Gösteri', '2025-12-02', 190.00),
('Rock Gecesi', 19, 'Konser', '2025-12-05', 250.00),
('Çocuk Festivali', 20, 'Festival', '2025-12-08', 150.00);

INSERT INTO Registrations (user_id, event_id, registration_date) VALUES
(1, 1, '2025-11-01'),
(2, 1, '2025-11-02'),
(3, 2, '2025-11-03'),
(4, 3, '2025-11-04'),
(5, 4, '2025-11-05'),
(6, 5, '2025-11-06'),
(7, 6, '2025-11-07'),
(8, 7, '2025-11-08'),
(9, 8, '2025-11-09'),
(10, 9, '2025-11-10'),
(11, 10, '2025-11-11'),
(12, 9, '2025-11-12'),
(13, 8, '2025-11-13'),
(14, 7, '2025-11-14'),
(15, 6, '2025-11-15'),
(16, 5, '2025-11-16'),
(17, 4, '2025-11-17'),
(18, 3, '2025-11-18'),
(19, 2, '2025-11-19'),
(20, 1, '2025-11-20');

-- ##########################
-- 5️⃣ Hazır Rapor Sorguları
-- ##########################

-- Kullanıcı bazlı etkinlik raporu
SELECT u.name AS Kullanıcı, e.event_name AS Etkinlik, e.date, e.category, e.ticket_price, c.city_name AS Şehir
FROM Registrations r
JOIN Users u ON r.user_id = u.user_id
JOIN Events e ON r.event_id = e.event_id
JOIN Cities c ON e.city_id = c.city_id
ORDER BY u.name;

-- Şehir bazlı etkinlik ve ortalama bilet fiyatı
SELECT c.city_name AS Şehir, COUNT(e.event_id) AS Etkinlik_Sayısı, AVG(e.ticket_price) AS Ortalama_Bilet_Fiyatı
FROM Cities c
LEFT JOIN Events e ON c.city_id = e.city_id
GROUP BY c.city_name
ORDER BY Etkinlik_Sayısı DESC;

-- Kategori bazlı toplam gelir
SELECT e.category AS Kategori, SUM(e.ticket_price) AS Toplam_Gelir
FROM Events e
GROUP BY e.category;

-- Yaklaşan etkinlikler
SELECT e.event_name AS Etkinlik, c.city_name AS Şehir, e.date AS Tarih, e.ticket_price AS Bilet_Fiyatı
FROM Events e
JOIN Cities c ON e.city_id = c.city_id
WHERE e.date >= CURDATE()
ORDER BY e.date ASC;

-- En pahalı ve en ucuz etkinlik
SELECT * FROM Events ORDER BY ticket_price DESC LIMIT 1;
SELECT * FROM Events ORDER BY ticket_price ASC LIMIT 1;

-- Tabloların tamamını görüntüleme
SELECT * FROM Users;
SELECT * FROM Cities;
SELECT * FROM Events;
SELECT * FROM Registrations;

-- ##########################
-- 6️⃣ Ekstra Analiz Raporları (Proje Güçlendirme)
-- ##########################

-- 6.1 Kullanıcı başına toplam harcama
SELECT u.name AS Kullanıcı, SUM(e.ticket_price) AS Toplam_Harcama
FROM Registrations r
JOIN Users u ON r.user_id = u.user_id
JOIN Events e ON r.event_id = e.event_id
GROUP BY u.name
ORDER BY Toplam_Harcama DESC;

-- 6.2 Şehir başına toplam gelir
SELECT c.city_name AS Şehir, SUM(e.ticket_price) AS Toplam_Gelir
FROM Events e
JOIN Cities c ON e.city_id = c.city_id
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY c.city_name
ORDER BY Toplam_Gelir DESC;

-- 6.3 Kategoriye göre en çok bilet satılan etkinlikler
SELECT e.category AS Kategori, e.event_name AS Etkinlik, COUNT(r.registration_id) AS Kayıt_Sayısı
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.category, e.event_name
ORDER BY Kayıt_Sayısı DESC;

-- 6.4 Yaklaşan etkinlikler (gelecek 30 gün)
SELECT e.event_name AS Etkinlik, c.city_name AS Şehir, e.date AS Tarih, e.ticket_price AS Bilet_Fiyatı
FROM Events e
JOIN Cities c ON e.city_id = c.city_id
WHERE e.date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY e.date ASC;

-- 6.5 En aktif kullanıcılar (en çok etkinliğe katılanlar)
SELECT u.name AS Kullanıcı, COUNT(r.registration_id) AS Katılım_Sayısı
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.name
ORDER BY Katılım_Sayısı DESC;