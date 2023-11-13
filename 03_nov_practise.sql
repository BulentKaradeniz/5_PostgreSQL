create table  sehirler1
(
	alan_kod char(5) primary key,
	isim varchar (10) not null,
	soyisim varchar (10),
	nufus real
);
select * from sehirler1;

insert into  sehirler1  values('07', 'Antalya', 'Alanya', 25000);

alter table sehirler1
rename column   soyisim to ilce_adı;

alter table sehirler1
rename column isim to  il_adi;

-------------------------------------

create table calisanlar2
(
	id char(5) primary key,
	isim varchar(10) unique,
	maas real not null,
	 ise_baslama date
);
--------
alter table calisanlar2
alter column isim type varchar(30);

INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar2 VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar2 VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar2 VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar2 VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar2 VALUES( null, 'filiz ' ,12000, '2018-04-14');

select * from calisanlar2;

create table  adresler 
(
	adres_id char(10),
	sokak varchar(50),
	cadde varchar(50),
	sehir varchar(20),
	constraint adresler_fk foreign key (adres_id) references calisanlar2(id)

);

select * from  adresler;

-- 13/11/2023  çalışma

create table  ogrenciler 
(
	id char(3) primary key,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_notu int
);

select * from ogrenciler;


insert into ogrenciler values(123,'Ali Can', 'Hasan', 75);
INSERT INTO ogrenciler VALUES(128, 'Veli Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(129, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

delete from ogrenciler where  id=124;
delete from ogrenciler where id > 126 ;

truncate table  ogrenciler;

create table  notlar
(
	talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	constraint notlar_fk foreign key (talebe_id)
	references  ogrenciler(id)	
	on delete cascade
);
--drop table ogrenciler;
drop table notlar;

select * from notlar;
select * from ogrenciler;
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

delete from  notlar   where talebe_id = '125';

delete from ogrenciler where id = '123';

---------------------
create  table musteriler
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10,'Mark','Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 

select * from musteriler;

select * 
from musteriler
where urun_isim ='Orange' or urun_isim ='Apple' or urun_isim ='Apricot';
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); INSERT INTO musteriler VALUES (20, 'Eddie',‘Apple');







