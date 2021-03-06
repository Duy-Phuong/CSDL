create DATABASE QUANLISINHVIEN
GO
USE QUANLISINHVIEN
go
Create table Khoa(
ma varchar(10)not null primary key,
tenKhoa nvarchar(100),
namThanhLap int
)
create table KhoaHoc(
Ma varchar(10) not null,
namBatDat int, 
namKetThuc int,
primary key (Ma)
)
create table SinhVien(
Ma varchar(10) not null,
hoTen nvarchar(100),
namSinh int, 
danToc nvarchar(20),
maLop varchar(10), 
constraint PK_SINHVIEN
primary key (Ma)
)
create table ChuongTrinh(
Ma varchar(10) not null primary key,
tenChuongTrinh nvarchar(100),

)

create table MonHoc(
Ma varchar(10) not null,
tenMonHoc nvarchar(100), 
maKhoa varchar(10),
primary key (Ma)
)

create table KetQua(
maSinhVien varchar(10) not null, 
maMonHoc varchar(10) not null,
lanThi int not null, 
diem float, 
primary key (maSinhVien, maMonHoc, lanThi)
)

create table GiangKhoa(
maChuongTrinh varchar(10) not null,
maKhoa varchar(10) not null,
maMonHoc varchar(10) not null,
namHoc int, 
hocKy int, 
soTietLyThuyet int, 
soTietThucHanh int,
soTinChi int,
 primary key (maChuongTrinh, maKhoa, maMonHoc)

)

create table Lop(
Ma varchar(10) not null,
maKhoaHoc varchar(10),
maKhoa varchar(10),
maChuongTrinh varchar(10),
soThuTu int, 
primary key (Ma)
)

--them khoa ngoai
alter table GiangKhoa
add constraint FK_GiangKhoa_ChuongTrinh
foreign key (maChuongTrinh)
references ChuongTrinh(Ma)

alter table Giangkhoa
add constraint FK_GiangKhoa_Khoa
foreign key (maKhoa)
references Khoa(ma)

alter table Giangkhoa
add constraint FK_GiangKhoa_MonHoc
foreign key (maMonHoc)
references MonHoc(Ma)

alter table Lop
add constraint FK_Lop_ChuongTrinh
foreign key (maChuongTrinh)
references ChuongTrinh(Ma)

alter table Lop
add constraint FK_Lop_KhoaHoc
foreign key (maKhoaHoc)
references KhoaHoc(Ma)

alter table Lop
add constraint FK_Lop_Khoa
foreign key (maKhoa)
references Khoa(ma)

alter table KetQua
add constraint FK_KetQua_SinhVien
foreign key (maSinhVien)
references SinhVien(Ma)

alter table KetQua
add constraint FK_KetQua_MonHoc
foreign key (maMonHoc)
references MonHoc(Ma)

alter table MonHoc
add constraint FK_MonHoc_Khoa
foreign key (maKhoa)
references Khoa(ma)

alter table SinhVien
add constraint FK_SinhVien_Lop
foreign key (maLop)
references Lop(Ma)

--thứ tự nhập:
--1. KhoaHoc
--2. ChuongTrinh
--3. Khoa
--4. Lop
--5. SinhVien
--6. MonHoc
--7. KetQua
--8. GiangKhoa

--KhoaHoc
insert into KhoaHoc
values('K2002', 2002, 2006)
insert into KhoaHoc
values('K2003', 2003, 2007)
insert into KhoaHoc
values('K2004', 2004, 2008)

--chuongtrinh
insert into ChuongTrinh
values ('CQ', N'Chính qui')

--khoa
insert into Khoa
values ('CNTT', N'Công nghệ thông tin', 1995)

insert into Khoa
values ('VL', N'Vật lý', 1970)

--lop
insert into Lop
values ('TH2002/01', 'K2002', 'CNTT', 'CQ', 1)
insert into Lop
values ('TH2002/02', 'K2002', 'CNTT', 'CQ', 2)
insert into Lop
values ('VL2003/01', 'K2003', 'VL', 'CQ', 1)

--Sv
insert into SinhVien
values ('0212001', N'Nguyễn Vĩnh An', 1984, 'Kinh', 'TH2002/01')
insert into SinhVien
values ('0212002', N'Nguyên Thanh Bình', 1985, 'Kinh', 'TH2002/01')
insert into SinhVien
values ('0212003', N'Nguyễn Thanh Cường', 1984, 'Kinh', 'TH2002/02')
insert into SinhVien
values ('0212004', N'Nguyễn Quốc Duy', 1983, 'Kinh', 'TH2002/02')
insert into SinhVien
values ('0311001', N'Phan Tuấn Anh', 1985, 'Kinh', 'VL2003/01')
insert into SinhVien
values ('0311002', N'Huỳnh Thanh Sang', 1984, 'Kinh', 'VL2003/01')

--MH
insert into MonHoc
values ('THT01', N'Toán cao cấp A1', 'CNTT')
insert into MonHoc
values ('VLT01', N'Toán cao cấp A1', 'VL')
insert into MonHoc
values ('THT02', N'Toán rời rạc', 'CNTT')
insert into MonHoc
values ('THCS01', N'Cấu trúc dữ liệu 1', 'CNTT')
insert into MonHoc
values ('THCS02', N'Hệ điều hành', 'CNTT')

--ket qua
insert into KetQua
values ('0212001', 'THT01', 1, 4)
insert into KetQua
values ('0212001', 'THT01', 2, 7)
insert into KetQua
values ('0212002', 'THT01', 1, 8)
insert into KetQua
values ('0212003', 'THT01', 1, 6)
insert into KetQua
values ('0212004', 'THT01', 1, 9)
insert into KetQua
values ('0212001', 'THT02', 1, 8)
insert into KetQua
values ('0212002', 'THT02', 1, 5.5)
insert into KetQua
values ('0212003', 'THT02', 1, 4)
insert into KetQua
values ('0212003', 'THT02', 2, 6)
insert into KetQua
values ('0212001', 'THCS01', 1, 6.5)
insert into KetQua
values ('0212002', 'THCS01', 1, 4)
insert into KetQua
values ('0212003', 'THCS01', 1, 7)

--GiangKhoa
insert into GiangKhoa
values ('CQ', 'CNTT', 'THT01', 2003, 1, 60, 0, 5)
insert into GiangKhoa
values ('CQ', 'CNTT', 'THT02', 2003, 2, 45, 0, 4)
insert into GiangKhoa
values ('CQ', 'CNTT', 'THCS01', 2004, 1, 45, 30, 4)

--in ra
select * from ChuongTrinh
select * from GiangKhoa
select * from KetQua
select * from SinhVien
select * from Khoa
select * from MonHoc
select * from KhoaHoc
select * from Lop

---năm 2002 khóa 2002-2006
select sv.hoTen, lp.maKhoa, lp.maKhoaHoc, k.namBatDat, k.namKetThuc
from (SinhVien sv join Lop lp on sv.maLop = lp.Ma) join KhoaHoc k on lp.maKhoaHoc = k.Ma
where lp.maKhoa = 'CNTT' AND (k.namBatDat = 2002 and k.namKetThuc = 2006)
-- tuoi < 18
select sv.Ma, sv.hoTen, sv.namSinh, k.namBatDat
from (SinhVien sv join Lop lp on sv.maLop = lp.Ma) join KhoaHoc k on lp.maKhoaHoc = k.Ma
where (k.namBatDat - sv.namSinh) < 18

-- khoa cntt chua học thcs01
select sv.hoTen, lp.maKhoa, lp.maKhoaHoc
from (SinhVien sv join Lop lp on sv.maLop = lp.Ma)
where lp.maKhoa = 'CNTT'
except
select sv.hoTen, lp.maKhoa, lp.maKhoaHoc
from (SinhVien sv join Lop lp on sv.maLop = lp.Ma) join KetQua k on sv.Ma = k.maSinhVien
where lp.maKhoa = 'CNTT' AND k.maMonHoc = 'THCS01'