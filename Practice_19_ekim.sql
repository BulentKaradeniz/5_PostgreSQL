CREATE TABLE Family_Member
( 
	ID CHAR(11),
	Name_Surname varchar(50),
	Birth_date date,
	Age real,
	Blood_Type varchar(10)
);

INSERT INTO Family_Member VALUES (49573812614, 'Hulya Karadeniz', '16-02-1975', 50, 'B rh+');
INSERT INTO Family_Member VALUES (43523918636, 'Bulent Karadeniz', '15-04-1973', 50, '0 rh+');
INSERT INTO Family_Member VALUES (00000000000,'Derya Karadeniz', '31-07-2006', 17, 'B rh+');
INSERT INTO Family_Member VALUES (00000000000, 'Damla Karadeniz', '29-04-2008', 15, 'A rh+');

CREATE TABLE members
AS
SELECT  name_surname
FROM Family_member;

-- tabloyu  çağırmak için --
SELECT * FROM family_member -- tablodaki tüm verileri çağırmak için

SELECT * FROM members 

SELECT  name_surname, age FROM Family_member
--------------------------------

create table ogretmenler
(
	kimlik_no char(11),
	isim varchar(50),
	brans varchar(20),
	cinsiyet varchar(5),
	yas real

)

select * from ogretmenler;

insert  into ogretmenler values (55555555555, 'Hülya Karadeniz','Fizik', 'Bayan', 45);
insert  into ogretmenler values (567597624, 'Bülent Karadeniz');
insert  into ogretmenler( brans, cinsiyet, yas) values ('Biyoloji', 'Bay', 45);






