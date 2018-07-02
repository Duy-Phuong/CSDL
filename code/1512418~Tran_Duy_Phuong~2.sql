create database QLKHUDANCU
go 
use QLKHUDANCU

create table PHUONG
(
	IDPhuong char(10),
	TenPhuong nvarchar(30),
	ChuTich char(10),
	primary key(IDPhuong)
)

create table TODANPHO
(
	IDPhuong char(10),
	STTTo int,
	Ten nvarchar(30),
	ToTruong char(10),
	primary key(IDPhuong,STTTo)
)

create table DAN
(
	IDPhuong char(10),
	IDDan char(10),
	STTTo int,
	HoTen nvarchar(30),
	SOCMND char(10),
	IDChuHo char(10),
	primary key(IDPhuong,IDDan)
)

alter table TODANPHO
add constraint FK_TODANPHO_PHUONG
foreign key (IDPhuong)
references PHUONG(IDPhuong)

alter table TODANPHO
add constraint FK_TODANPHO_DAN
foreign key (IDPhuong, ToTruong)
references DAN(IDPhuong,IDDan)

alter table PHUONG
add constraint FK_PHUONG_DAN2
foreign key (IDPhuong, ChuTich)
references DAN(IDPhuong,IDDan)

alter table DAN
add constraint FK_DAN_PHUONG
foreign key (IDPhuong)
references PHUONG(IDPhuong)

alter table DAN
add constraint FK_DAN_DAN
foreign key (IDPhuong,IDChuHo)
references DAN(IDPhuong,IDDan)

alter table DAN
add constraint FK_DAN_DAN2
foreign key (IDPhuong,STTTo)
references TODANPHO(IDPhuong,STTTo)

--drop database QLKHUDANCU
-- thu tu nhap
-- 1 insert table phuong
-- 2 insert todanpho
-- 3 insert dan
--  4 update phuong
-- 5 update todanpho
-- 6 update dan
go

insert into PHUONG
values('P01',N'Phường Tân Hòa', NULL)

insert into PHUONG
values('P02',N'Phường Phú Quý',NULL)

insert into TODANPHO
values('P01', 1,N'Tổ 1',NULL)

insert into TODANPHO
values('P01', 2,N'Tổ 2',NULL)

insert into TODANPHO
values('P02', 2,N'Tổ 1',NULL)

insert into DAN
values('P01','D01', NULL ,N'Mai','240674018',NULL)

insert into DAN
values('P01','D02', NULL ,N'Nam','240674027',NULL)

insert into DAN
values('P01','D03', NULL ,N'Quang','240674063',NULL)

insert into DAN
values('P02','D01', NULL ,N'Hùng','240674504',NULL)

insert into DAN
values('P02','D02', NULL ,N'Tùng','240674505',NULL)

insert into DAN
values('P02','D03', NULL ,N'Thủy','240674506',NULL)

update PHUONG
set ChuTich = 'D01'
where (IDPhuong = 'P01')

update PHUONG
set ChuTich = 'D02'
where (IDPhuong = 'P02')

update TODANPHO
set ToTruong = 'D01'
where (IDPhuong = 'P01' and STTTo = 1)

update TODANPHO
set ToTruong = 'D03'
where (IDPhuong = 'P02' and STTTo = 2)

update TODANPHO
set ToTruong = 'D03'
where (IDPhuong = 'P01' and STTTo = 2)

update DAN
set IDChuHo = 'D01'
where (IDPhuong = 'P01' and IDDAN = 'D02') or (IDPhuong = 'P01' and IDDAN = 'D01')

update DAN
set IDChuHo = 'D03'
where (IDPhuong = 'P01' and IDDAN = 'D03') 

update DAN
set IDChuHo = 'D02'
where (IDPhuong = 'P02' and IDDAN = 'D02') or (IDPhuong = 'P02' and IDDAN = 'D01') or (IDPhuong = 'P02' and IDDAN = 'D03')


update DAN
set STTTo = 1
where (IDPhuong = 'P01' and IDDAN = 'D02') or (IDPhuong = 'P01' and IDDAN = 'D01')

update DAN
set STTTo = 2
where (IDPhuong = 'P02' and IDDAN = 'D02') or (IDPhuong = 'P02' and IDDAN = 'D01') or (IDPhuong = 'P02' and IDDAN = 'D03') or (IDPhuong = 'P01' and IDDAN = 'D03') 



select * FROM PHUONG
select * FROM TODANPHO
select * FROM DAN

