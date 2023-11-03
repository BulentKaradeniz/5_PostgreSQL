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