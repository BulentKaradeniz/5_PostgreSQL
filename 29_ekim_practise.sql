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





