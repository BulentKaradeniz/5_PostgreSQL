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


