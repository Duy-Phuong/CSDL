create database QLCLB1
go 
use QLCLB1

create table CLB
(
	IDCLB char(10),
	TenCLB nvarchar(50),
	DiaChi nvarchar(40),
	primary key(IDCLB)
)

create table DOI
(
	IDCLB char(10),
	IDDoi char(10),
	Ten nvarchar(30),
	IDDoiTruong char(10),
	primary key(IDDoi,IDCLB)
)

create table HOIVIEN
(
	IDCLB char(10),
	IDHoiVien char(10),
	HoTen nvarchar(30),
	NgaySinh datetime,
	IDDoi char(10),
	IDBanCungTapLuyen char(10),
	primary key(IDHoiVien,IDCLB)
)

alter table DOI
add constraint FK_DOI_CLB
foreign key (IDCLB)
references CLB(IDCLB)

alter table DOI
add constraint FK_DOI_HOIVIEN
foreign key (IDDoiTruong,IDCLB)
references HOIVIEN(IDHoiVien,IDCLB)

alter table HOIVIEN
add constraint FK_HOIVIEN_CLB
foreign key (IDCLB)
references CLB(IDCLB)

alter table HOIVIEN
add constraint FK_HOIVIEN_DOI
foreign key (IDDoi,IDCLB)
references DOI(IDDoi,IDCLB)

alter table HOIVIEN
add constraint FK_BANTAPCUNG_HOIVIEN
foreign key (IDBanCungTapLuyen,IDCLB)
references HOIVIEN(IDHoiVien,IDCLB)
-- thu tu nhap
-- 1 insert table CLB
-- 2 insert doi
-- 3 insert hoi vien 
--  4 update doi
-- 5 update hoivien 
insert into CLB
values('C01',N'Câu lạc bộ Phan Đình Phùng',N'P1, Q5, Hồ Chí Minh')

insert into CLB
values('C02',N'Câu lạc bộ Võ Thị Sáu',N'P3, Q1, Hồ Chí Minh')

insert into DOI
values('C01','D01',N'Đội 1',NULL)

insert into DOI
values('C01','D02',N'Đội 2',NULL)

insert into DOI
values('C02','D01',N'Đội 1',NULL)

insert into HOIVIEN
values('C01','H01',N'Tiến','07/15/1984','D01',NULL)

insert into HOIVIEN
values('C01','H02',N'Tùng','09/26/1983','D02',NULL)

insert into HOIVIEN
values('C01','H03',N'Bình','10/18/1986','D01',NULL)

insert into HOIVIEN
values('C01','H04',N'Đông','12/09/1987','D02',NULL)

insert into HOIVIEN
values('C02','H01',N'Nam','05/03/1988','D01',NULL)

insert into HOIVIEN
values('C02','H02',N'Á','06/05/1986','D01',NULL)

update DOI
set IDDoiTruong = 'H01'
where (IDDoi = 'D01' and IDCLB = 'C01')

update DOI
set IDDoiTruong = 'H02'
where (IDDoi = 'D02' and IDCLB = 'C01')

update DOI
set IDDoiTruong = 'H01'
where (IDDoi = 'D01' and IDCLB = 'C02')

update HOIVIEN
set IDBanCungTapLuyen = 'H03'
where (IDHoiVien = 'H01' and IDCLB = 'C01')

update HOIVIEN
set IDBanCungTapLuyen = 'H04'
where (IDHoiVien = 'H02' and IDCLB = 'C01')

update HOIVIEN
set IDBanCungTapLuyen = 'H01'
where (IDHoiVien = 'H03' and IDCLB = 'C01')

update HOIVIEN
set IDBanCungTapLuyen = 'H02'
where (IDHoiVien = 'H04' and IDCLB = 'C01')

update HOIVIEN
set IDBanCungTapLuyen = 'H02'
where (IDHoiVien = 'H01' and IDCLB = 'C02')

update HOIVIEN
set IDBanCungTapLuyen = 'H01'
where (IDHoiVien = 'H02' and IDCLB = 'C02')

select * FROM CLB
select * FROM DOI
select * FROM HOIVIEN

