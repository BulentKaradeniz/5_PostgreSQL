create table personel
(
	id int,
	isim varchar(50),
	sehir varchar(50),
	maas int,
	sirket varchar(20)
);

select * from personel

insert into personel values(123456789, 'Johny Walk', 'New Hampshire', 2500,'IBM');
INSERT INTO personel VALUES(123456799, 'Tony Walk', 'New Hampshire', 2500,'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500,'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLSFARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000,'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TDBANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500,'IBM');

drop table  personel;

create table isciler
(
	id int,
	isim varchar(50),
	sehir varchar(50),
	maas int,
	sirket varchar(20)
);

insert into isciler values(123456789,'Jhon Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(123456789,'JohnWalker','Florida',2500,'IBM');
INSERT INTO isciler VALUES(234567890,'BradPitt','Florida',1500,'APPLE');
INSERT INTO isciler VALUES(345678901,'EddieMurphy','Texas',3000,'IBM');
INSERT INTO isciler VALUES(456789012,'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123,'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012,'Brad Pitt', 'Texas', 1500,'GOOGLE');
INSERT INTO isciler VALUES(123456710,'Mark Stone', 'Pennsylvania', 2500,'IBM');

select * from isciler;
-------------------
/*Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen queryyaziniz */
select  isim,id
from personel
where id in(select id 
		   from isciler
		   where isciler.id=personel.id);

select  id
from personel
where  id in(select id
			 from isciler
			 where isciler.id = personel.id); 
--------------------------
2)Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen queryyaziniz

Örnek 1: İki tablo arasında kesişen (ortak) değerleri bulmak
SELECT column_name FROM table1
INTERSECT
SELECT column_name FROM table2;
-----------------------------
SELECT column_name FROM table
WHERE column_name IN
(
    SELECT column_name FROM other_table
    INTERSECT
    SELECT column_name FROM another_table
);
-----------------------------------
select  isim, id
from personel
intersect
select isim,id
from isciler;
------------------------------------------------
select * from personel
3)Personel tablosunda kac farkli sehirden personelvar?

select count (distinct sehir) as sehir_sayisi 
from personel;

select count (distinct sehir) as sehir_sayisi
from isciler;
-------------------------------------------------------
4)Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Queryyaziniz
select * from personel

select * from  personel
where  mod (id,2)=0;

---------------
5)Personel tablosunda kac tane kayit oldugunu gosteren queryyazin

select count(*)
from personel;

select count(id) as kayıt_sayisi
from personel;

select count(*)
from isciler;
------------------------------
--6)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin

select * from isciler

select max(maas) as max_maas
from isciler;

---tüm bilgileri için
 select * from isciler
 where maas in (select max(maas)
			   from isciler);
			   
---7)Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren queryyazin

select * from  personel;

select min(maas)
from personel;

select * from personel
where maas in (select min(maas)
			  from personel);
			  
-----başka bir yol			  
select * from  personel
order by maas
fetch next 1 row only;

-----------------------
SELECT *
FROM Personel
WHERE Maas = (SELECT MIN(Maas) FROM Personel);

select avg(maas) from personel;

-------------------
--8)Isciler tablosunda ikinci en yuksek maasi maasi gosteren queryyazin.
/*Bu SQL sorgusu, "ISCILER" tablosundaki "maas" sütununda en yüksek maaşı bulurken "PERSONEL" tablosundaki en yüksek maaşı hariç tutmak için "<>" (eşit değil) operatörünü kullanıyor.
"<>" operatörü, SQL'de "eşit değil" anlamına gelir. Yani, bu sorgu "ISCILER" tablosundan en yüksek maaşa sahip olan personeli hariç tutar ve geriye kalan personellerin maaşlarının en yükseğini bulur.
*/
select  * from isciler

select max(maas)
from isciler
where maas<>(select max (maas)
			from personel);
-------------			
select * from isciler
order by maas desc
fetch next  3 row only;
-------------
9)personel tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren queryyazin
select * from personel
order by maas  desc

select * from isciler
order by maas desc


select * from  personel
order by maas 
offset 1 row 
fetch next 1 row only;
 /*
Bu SQL sorgusu, "PERSONEL" tablosundan maaşa göre sıralanmış olan verilerden ikinci en düşük maaşı alan personelin tüm bilgilerini getirmek için kullanılır. Sorgu iki önemli SQL ifadesini içerir: "OFFSET" ve "FETCH NEXT."

İşte sorgunun adım adım açıklaması:

"SELECT * FROM PERSONEL": Bu kısmı, "PERSONEL" tablosundan tüm sütunları ve tüm satırları seçmek için kullanır.

"ORDER BY Maas": Bu bölüm, sonuçların "Maas" sütununa göre sıralandığını belirtir. Bu sayede personelin maaşları küçükten büyüğe sıralanmış olur.

"OFFSET 1 ROW": "OFFSET" ifadesi, sorgu sonucu setinin başlangıç noktasını belirler. Bu durumda, sorgu sonucu setinin ilk satırını atlamadan önce "1 ROW" yani 1 satır atlanır. Yani, en düşük maaşı alan kişiyi atlar ve ikinci en düşük maaşı alan kişiden başlar.

"FETCH NEXT 1 ROW ONLY": "FETCH NEXT" ifadesi, sonuç kümesinden belirtilen sayıda satırın getirilmesini sağlar. Bu durumda, yalnızca bir sonraki satırı (yani ikinci en düşük maaşı alan kişiyi) getirmek için kullanılır.
*/
-------
--10)Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tumbilgilerini gosteren query yazin
select * from isciler;

/* hatalı  sogu  chat gpt den 
DELETE FROM isciler
WHERE (id, isim, sehir , maas,  sirket) IN (
    SELECT id, isim, sehir , maas,  sirket
    FROM isciler
    GROUP BY id, isim, sehir , maas,  sirket
    HAVING COUNT(*) > 1
);

/*"HAVING COUNT(*) > 1" ifadesi, SQL'de "GROUP BY" ifadesiyle birlikte kullanılarak yinelenen (duplicate) satırları bulmak ve yinelenenlerin sayısını belirlemek için kullanılır.

İşte bu ifadeyi daha detaylı açıklamak için bir örnek:

Diyelim ki bir tabloda bir sütun adı "product_name" olsun ve bu sütunda aynı ürün adına sahip birden fazla satır bulunsun. "HAVING COUNT() > 1" ifadesi, bu durumu belirlemek için kullanılır. Burada "COUNT()" ile gruplandırılan her ürün adının toplam sayısı hesaplanır.

"COUNT(*)" ifadesi, her ürün adının gruplandırıldığı tüm satırların sayısını temsil eder.
"HAVING COUNT(*) > 1" ifadesi, yalnızca birden fazla satırı olan (yinelenen) ürün adlarını seçer. Yani, "product_name" sütununda birden fazla kez tekrarlanan ürün adlarını seçmek için kullanılır.
Ayrıca, "HAVING" ifadesi "GROUP BY" ifadesi ile birlikte kullanılır ve gruplandırılmış veriler üzerinde filtreleme yapmak için kullanılır. Yani, yinelenen satırları gruplandırmak ve ardından yinelenenlerin sayısına göre filtrelemek için "HAVING" ifadesi kullanılır.
*/
*/
select *
from isciler
where maas<>(select max(maas)
			from isciler)
order by  maas desc;


