import mysql.connector
import pandas as pd

# MySQL bağlantısı
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Merve2004!",
    database="SehirEtkinlikConnv"
)

cursor = conn.cursor()

# 1️⃣ Kullanıcı bazlı etkinlik raporu
query1 = """
SELECT u.name AS Kullanıcı, e.event_name AS Etkinlik, e.date, e.category, e.ticket_price, c.city_name AS Şehir
FROM Registrations r
JOIN Users u ON r.user_id = u.user_id
JOIN Events e ON r.event_id = e.event_id
JOIN Cities c ON e.city_id = c.city_id
ORDER BY u.name;
"""
df1 = pd.read_sql(query1, conn)
print("=== Kullanıcı Bazlı Etkinlik Raporu ===")
print(df1, "\n")

# 2️⃣ Şehir bazlı etkinlik ve ortalama bilet fiyatı
query2 = """
SELECT c.city_name AS Şehir, COUNT(e.event_id) AS Etkinlik_Sayısı, AVG(e.ticket_price) AS Ortalama_Bilet_Fiyatı
FROM Cities c
LEFT JOIN Events e ON c.city_id = e.city_id
GROUP BY c.city_name
ORDER BY Etkinlik_Sayısı DESC;
"""
df2 = pd.read_sql(query2, conn)
print("=== Şehir Bazlı Etkinlik Raporu ===")
print(df2, "\n")

# 3️⃣ Kategori bazlı toplam gelir
query3 = "SELECT e.category AS Kategori, SUM(e.ticket_price) AS Toplam_Gelir FROM Events e GROUP BY e.category;"
df3 = pd.read_sql(query3, conn)
print("=== Kategori Bazlı Toplam Gelir ===")
print(df3, "\n")

# 4️⃣ Yaklaşan etkinlikler
query4 = """
SELECT e.event_name AS Etkinlik, c.city_name AS Şehir, e.date AS Tarih, e.ticket_price AS Bilet_Fiyatı
FROM Events e
JOIN Cities c ON e.city_id = c.city_id
WHERE e.date >= CURDATE()
ORDER BY e.date ASC;
"""
df4 = pd.read_sql(query4, conn)
print("=== Yaklaşan Etkinlikler ===")
print(df4, "\n")

# Bağlantıyı kapat
cursor.close()
conn.close()