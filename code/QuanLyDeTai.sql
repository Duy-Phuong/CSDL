CREATE DATABASE QuanLyDeTai
GO
USE QuanLyDeTai
GO

CREATE TABLE GIAOVIEN
(
	MaGV  VARCHAR(10) NOT NULL PRIMARY KEY,
	HoTen NVARCHAR(100),
	Luong FLOAT,
	Phai NVARCHAR(10),
	NgaySinh DATE,
	DiaChi NVARCHAR(100),
	MaBM VARCHAR(10),
	GVQLCM VARCHAR(10),
	CHECK (Phai IN ('Nam','Nữ'))
)
GO

CREATE TABLE KHOA 
(
MaKhoa VARCHAR(10) NOT NULL PRIMARY KEY,
TenKhoa NVARCHAR(100),
NamTL int,
Phong VARCHAR(5),
DienThoai VARCHAR(11),
TruongKhoa VARCHAR(10),
NgayNhanChuc DATE
)
GO
CREATE TABLE BOMON
(
MaBM VARCHAR(10) NOT NULL PRIMARY KEY,
TenBM NVARCHAR(100),
Phong VARCHAR(5),
DienThoai VARCHAR(12),
TruongBM VARCHAR(10),
MaKhoa VARCHAR(10),
NgayNhanChuc DATE,
)
GO

CREATE TABLE DETAI
(
MaDT VARCHAR(10) NOT NULL PRIMARY KEY,
TenDT NVARCHAR(100),
CapQL NVARCHAR(30),
KinhPhi FLOAT,
NgayBD DATE,
NgayKT DATE,
MaCD VARCHAR(10),
GVCNDT VARCHAR(10)

)
GO
 CREATE TABLE CHUDE 
 (
 MaCD varchar(10) NOT NULL PRIMARY KEY,
 TenCD NVARCHAR(100)
 )
 GO 

 CREATE TABLE CONGVIEC 
 (
 MaDT VARCHAR(10) NOT NULL,
 STT INT,
 TenCV  NVARCHAR(50),
 NgayBD DATE,
 NgayKT DATE,
 PRIMARY KEY (MaDT,STT)
 )
 GO 

 CREATE TABLE THAMGIADT
 (
 MaGV VARCHAR(10) NOT NULL,
 MaDT VARCHAR(10) NOT NULL,
 STT INT NOT NULL,
 PhuCap FLOAT,
 KetQua NVARCHAR(10),
 PRIMARY KEY (MaGV,MaDT,STT)
 )
 GO

 CREATE TABLE NGUOITHAN
 (
 MaGV VARCHAR(10),
 Ten NVARCHAR(100),
 NgaySinh DATE,
 Phai NVARCHAR(10),
 PRIMARY KEY (MaGV,Ten),
 CHECK (Phai IN (N'Nam',N'Nữ'))
 )
 GO
 
 CREATE TABLE GV_DT
 (
 MaGV VARCHAR(10) NOT NULL,
 DienThoai VARCHAR(20) NOT NULL,
 PRIMARY KEY (MaGV,DienThoai)
 )
 GO
 
 /*
 -------------------------TẠO THAM CHIẾU KHÓA NGOẠI--------------------
 ----------------------------------------------------------------------
 */
 

 ALTER TABLE dbo.GIAOVIEN
 ADD CONSTRAINT GV1
 FOREIGN KEY (GVQLCM) REFERENCES dbo.GIAOVIEN(MaGV)

 ALTER TABLE dbo.GIAOVIEN
 ADD CONSTRAINT gv2
 FOREIGN KEY (MaBM) REFERENCES dbo.BOMON(MaBM)

 ALTER TABLE dbo.KHOA
 ADD CONSTRAINT K1
 FOREIGN KEY (TruongKhoa) REFERENCES dbo.GIAOVIEN(MaGV)

 ALTER TABLE dbo.BOMON 
 ADD CONSTRAINT BM1
 FOREIGN KEY (TruongBM) REFERENCES dbo.GIAOVIEN(MaGV)

 
 ALTER TABLE dbo.BOMON 
 ADD CONSTRAINT BM2
 FOREIGN KEY (MaKhoa) REFERENCES dbo.KHOA(MaKhoa)

ALTER TABLE dbo.DETAI
ADD CONSTRAINT DT1
FOREIGN KEY (MaCD) REFERENCES dbo.CHUDE(MaCD)

ALTER TABLE dbo.DETAI 
ADD CONSTRAINT DT2
FOREIGN KEY (GVCNDT) REFERENCES dbo.GIAOVIEN(MaGV)

ALTER TABLE dbo.CONGVIEC
ADD CONSTRAINT CV1
FOREIGN KEY (MaDT) REFERENCES dbo.DETAI(MaDT)

ALTER TABLE dbo.THAMGIADT 
ADD CONSTRAINT TGDT1
FOREIGN KEY (MaGV) REFERENCES dbo.GIAOVIEN(MaGV)

ALTER TABLE dbo.THAMGIADT
ADD CONSTRAINT TGDT2
FOREIGN KEY (MaDT,STT) REFERENCES dbo.CONGVIEC(MaDT,STT)

ALTER TABLE dbo.GV_DT 
ADD CONSTRAINT GVDT1
FOREIGN KEY (MaGV) REFERENCES dbo.GIAOVIEN(MaGV)

ALTER TABLE dbo.NGUOITHAN
ADD CONSTRAINT NT1
FOREIGN KEY (MaGV) REFERENCES dbo.GIAOVIEN(MaGV)

GO

INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '001' , -- MaGV - varchar(10)
          N'Nguyễn Hoài An' , -- HoTen - nvarchar(100)
          2000.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19730215' , -- NgaySinh - date
          N'25/3 Lạc Long Quân, Q.10,TP Hồ Chí Minh' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '002' , -- MaGV - varchar(10)
          N'Trần Trà Hương' , -- HoTen - nvarchar(100)
          2500.0 , -- Luong - float
          'Nữ' , -- Phai - varchar(10)
          '19600620' , -- NgaySinh - date
          N'125 Trần Hưng Đạo, Q1, TP Hồ Chí Minh',--varchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '003' , -- MaGV - varchar(10)
          N'Nguyễn Ngọc Ánh',-- HoTen - nvarchar(100)
          2200.0 , -- Luong - float
          'Nữ' , -- Phai - varchar(10)
          '19750511' , -- NgaySinh - date
          N'12/21 Võ Văn Ngân, Thủ Đức, TP Hồ Chí Minh' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10) 
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '004' , -- MaGV - varchar(10)
          N'Trương Nam Sơn' , -- HoTen - nvarchar(100)
          2300.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19590625' , -- NgaySinh - date
          N'215 Lý Thường Kiệt, TP Biên Hòa' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '005' , -- MaGV - varchar(10)
          N'Lý Hoàng Hà',-- HoTen - nvarchar(100)
          2500.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19541023' , -- NgaySinh - date
          N'22/5 Nguyễn Xí, Bình Thành, TP Hồ CHí Minh ',--(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '006' , -- MaGV - varchar(10)
          N'Trần Bạch Tuyết' , -- HoTen - nvarchar(100)
          1500.0 , -- Luong - float
          'Nữ' , -- Phai - varchar(10)
          '19800520' , -- NgaySinh - date
          N'127 Hùng Vương, TP Mỹ Tho' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '007' , -- MaGV - varchar(10)
          N'Nguyễn An Trung',--Ten - nvarchar(100)
          2100.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19760605' , -- NgaySinh - date234 3/2
          N'234 3/2 , TP Biên Hòa ', -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '008' , -- MaGV - varar(10)
          N'Trần Trung Hiếu' , -- HoTen - nvarchar(100)
          1800.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19770806' , -- NgaySinh - date
          N'22/11 Lý Thường Kiệt, TP Mỹ Tho' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '009' , -- MaGV - varchar(10)
          N'Trần Hoàng Nam' , -- HoTen - nvarchar(100)
          2000.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19751122' , -- NgaySinh - date
          N'234 Trần Não, An Phú,TP Hồ Chí Minh' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )

		
INSERT dbo.GIAOVIEN
        ( MaGV ,
          HoTen ,
          Luong ,
          Phai ,
          NgaySinh ,
          DiaChi ,
          MaBM ,
          GVQLCM
        )
VALUES  ( '010' , -- MaGV - varchar(10)
          N'Phạm Nam Thanh' , -- HoTen - nvarchar(100)
          1500.0 , -- Luong - float
          'Nam' , -- Phai - varchar(10)
          '19801212' , -- NgaySinh - date
          N'221 Hùng Vương, Q.5, TP Hồ Chí Minh' , -- DiaChi - nvarchar(100)
          null , -- MaBM - varchar(10)
          null  -- GVQLCM - varchar(10)
        )


	INSERT dbo.KHOA
	        ( MaKhoa ,
	          TenKhoa ,
	          NamTL ,
	          Phong ,
	          DienThoai ,
	          TruongKhoa ,
	          NgayNhanChuc
	        )
	VALUES  ( 'CNTT' , -- MaKhoa - varchar(10)
	          N'Công nghệ thông tin' , -- TenKhoa - nvarchar(100)
	          1995 , -- NamTL - date
	          'B11' , -- Phong - varchar(5)
	          '0838123456' , -- DienThoai - varchar(11)
	          '002' , -- TruongKhoa - varchar(10)
	          '20050220'  -- NgayNhanChuc - date
	        )

	
	INSERT dbo.KHOA
	        ( MaKhoa ,
	          TenKhoa ,
	          NamTL ,
	          Phong ,
	          DienThoai ,
	          TruongKhoa ,
	          NgayNhanChuc
	        )
	VALUES  ( 'HH' , -- MaKhoa - varchar(10)
	          N'Hóa Học' , -- TenKhoa - nvarchar(100)
	          1980 , -- NamTL - date
	          'B41' , -- Phong - varchar(5)
	          '0838456456' , -- DienThoai - varchar(11)
	          '007' , -- TruongKhoa - varchar(10)
	          '20011015'  -- NgayNhanChuc - date
	        )

			
	INSERT dbo.KHOA
	        ( MaKhoa ,
	          TenKhoa ,
	          NamTL ,
	          Phong ,
	          DienThoai ,
	          TruongKhoa ,
	          NgayNhanChuc
	        )
	VALUES  ( 'SH' , -- MaKhoa - varchar(10)
	          N'Sinh Học' , -- TenKhoa - nvarchar(100)
	          1980 , -- NamTL - date
	          'B31' , -- Phong - varchar(5)
	          '0838454454' , -- DienThoai - varchar(11)
	          '004' , -- TruongKhoa - varchar(10)
	          '20001011'  -- NgayNhanChuc - date
	        )

			
	INSERT dbo.KHOA
	        ( MaKhoa ,
	          TenKhoa ,
	          NamTL ,
	          Phong ,
	          DienThoai ,
	          TruongKhoa ,
	          NgayNhanChuc
	        )
	VALUES  ( 'VL' , -- MaKhoa - varchar(10)
	          N'Vật Lý' , -- TenKhoa - nvarchar(100)
	          1976 , -- NamTL - date
	          'B21' , -- Phong - varchar(5)
	          '0838223223' , -- DienThoai - varchar(11)
	          '005' , -- TruongKhoa - varchar(10)
	          '20030918'  -- NgayNhanChuc - date
	        )

--1
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'CNTT' , -- MaBM - varchar(10)
          N'Công Nghệ Tri Thức' , -- TenBM - nvarchar(100)
          'B15' , -- Phong - varchar(5)
          '0838126126' , -- DienThoai - varchar(12)
          null , -- TruongBM - varchar(10)
          'CNTT' , -- MaKhoa - varchar(10)
          null  -- NgayNhanChuc - date
        )

--2
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'HHC' , -- MaBM - varchar(10)
          N'Hóa Hữu Cơ' , -- TenBM - nvarchar(100)
          'B44' , -- Phong - varchar(5)
          '838222222' , -- DienThoai - varchar(12)
          null , -- TruongBM - varchar(10)
          'HH' , -- MaKhoa - varchar(10)
          null  -- NgayNhanChuc - date
        )

--3
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'HL' , -- MaBM - varchar(10)
          N'Hóa Lý' , -- TenBM - nvarchar(100)
          'B42' , -- Phong - varchar(5)
          '0838878787' , -- DienThoai - varchar(12)
          null , -- TruongBM - varchar(10)
          'HH' , -- MaKhoa - varchar(10)
          null  -- NgayNhanChuc - date
        )

--4	
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'HPT' , -- MaBM - varchar(10)
          N'Hóa Phân Tích' , -- TenBM - nvarchar(100)
          'B43' , -- Phong - varchar(5)
          '0838777777' , -- DienThoai - varchar(12)
          '007' , -- TruongBM - varchar(10)
          'HH' , -- MaKhoa - varchar(10)
          '20071015'  -- NgayNhanChuc - date
        )

--5		
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'HTTT' , -- MaBM - varchar(10)
          N'Hệ Thống thông Tin' , -- TenBM - nvarchar(100)
          'B13' , -- Phong - varchar(5)
          '0838125125' , -- DienThoai - varchar(12)
          '002' , -- TruongBM - varchar(10)
          'CNTT' , -- MaKhoa - varchar(10)
          '20040920'  -- NgayNhanChuc - date
        )

--6
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'MMT' , -- MaBM - varchar(10)
          N'Mạng Máy Tính' , -- TenBM - nvarchar(100)
          'B16' , -- Phong - varchar(5)
          '0838676767' , -- DienThoai - varchar(12)
          '001' , -- TruongBM - varchar(10)
          'CNTT' , -- MaKhoa - varchar(10)
          '20050515'  -- NgayNhanChuc - date
        )
	
--7	
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'SH' , -- MaBM - varchar(10)
          N'Sinh Hóa' , -- TenBM - nvarchar(100)
          'B33' , -- Phong - varchar(5)
          '0838898898' , -- DienThoai - varchar(12)
          null , -- TruongBM - varchar(10)
          'SH' , -- MaKhoa - varchar(10)
          null  -- NgayNhanChuc - date
        )

--8		
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'VLĐT' , -- MaBM - varchar(10)
          N'Vật Lý điện tử' , -- TenBM - nvarchar(100)
          'B23' , -- Phong - varchar(5)
          '0838234234' , -- DienThoai - varchar(12)
          null , -- TruongBM - varchar(10)
          'VL' , -- MaKhoa - varchar(10)
          null  -- NgayNhanChuc - date
        )

--9		
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'VLUD' , -- MaBM - varchar(10)
          N'Vật Lý ứng Dụng' , -- TenBM - nvarchar(100)
          'B24' , -- Phong - varchar(5)
          '0838454545' , -- DienThoai - varchar(12)
          '005' , -- TruongBM - varchar(10)
          'VL' , -- MaKhoa - varchar(10)
          '20060218'  -- NgayNhanChuc - date
        )
	
-- 10	
INSERT dbo.BOMON
        ( MaBM ,
          TenBM ,
          Phong ,
          DienThoai ,
          TruongBM ,
          MaKhoa ,
          NgayNhanChuc
        )
VALUES  ( 'VS' , -- MaBM - varchar(10)
          N'Vi Sinh' , -- TenBM - nvarchar(100)
          'B32' , -- Phong - varchar(5)
          '0838909090' , -- DienThoai - varchar(12)
          '004' , -- TruongBM - varchar(10)
          'SH' , -- MaKhoa - varchar(10)
          '20070101'  -- NgayNhanChuc - date
        )

--CHỦ ĐỀ
INSERT dbo.CHUDE
		        ( MaCD, TenCD )
		VALUES  ( 'NCPT', -- MaCD - varchar(10)
		          N'Nghiên Cứu Phát Triển'  -- TenCD - nvarchar(100)
		          )
				  
INSERT dbo.CHUDE
		        ( MaCD, TenCD )
		VALUES  ( 'QLGD', -- MaCD - varchar(10)
		          N'Quản Lý Giáo Dục'  -- TenCD - nvarchar(100)
		          )
				  
INSERT dbo.CHUDE
		        ( MaCD, TenCD )
		VALUES  ( 'UDCN', -- MaCD - varchar(10)
		          N'Ứng Dụng Công Nghệ'  -- TenCD - nvarchar(100)
		          )

-- ĐỀ TÀI
INSERT dbo.DETAI
( MaDT ,
TenDT ,
CapQL ,
KinhPhi ,
NgayBD ,
NgayKT ,
MaCD ,
GVCNDT
)
VALUES  ( '001' , -- MaDT - varchar(10)
				            N'HTTT Quản lý các trường đại học' , -- TenDT - nvarchar(30)
				            N'ĐHQG' , -- CapQL - nvarchar(30)
				            20.0 , -- KinhPhi - float
				            '20071020' , -- NgayBD - date
				            '20081020' , -- NgayKT - date
				            'QLGD' , -- MaCD - varchar(10)
				            '002'  -- GVCNDT - varchar(10)
				          )

INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '002' , -- MaDT - varchar(10)
          N'HTTT quản lý giáo vụ cho một khoa' , -- TenDT - nvarchar(100)
          N'Trường' , -- CapQL - nvarchar(30)
          20.0 , -- KinhPhi - float
          '20001012' , -- NgayBD - date
          '20081012' , -- NgayKT - date
          'QLGD' , -- MaCD - varchar(10)
          '002'  -- GVCNDT - varchar(10)
        )


INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '003' , -- MaDT - varchar(10)
          N'Nghiên Cứu Chế tạo sợi Nano Platin' , -- TenDT - nvarchar(100)
          N'ĐHQG' , -- CapQL - nvarchar(30)
          300.0 , -- KinhPhi - float
          '20080515' , -- NgayBD - date
          '20100515' , -- NgayKT - date
          'NCPT' , -- MaCD - varchar(10)
          '005'  -- GVCNDT - varchar(10)
        )


INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '004' , -- MaDT - varchar(10)
          N'Tạo vật liệu sinh học bằng màng ối người' , -- TenDT - nvarchar(100)
          N'Nhà Nước' , -- CapQL - nvarchar(30)
          100.0 , -- KinhPhi - float
          '20070101' , -- NgayBD - date
          '20031010' , -- NgayKT - date
          'NCPT' , -- MaCD - varchar(10)
          '004'  -- GVCNDT - varchar(10)
        )


INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '005' , -- MaDT - varchar(10)
          N'Ứng Dụng hóa học xanh' , -- TenDT - nvarchar(100)
          N'Trường' , -- CapQL -nvarchar(30)
          200.0 , -- KinhPhi - float
          '20031010' , -- NgayBD - date
          '20041210' , -- NgayKT - date
          'UDCN' , -- MaCD - varchar(10)
          '007'  -- GVCNDT - varchar(10)
        )


INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '006' , -- MaDT - varchar(10)
          N'Nghiên cứu tế bào gốc' , -- TenDT - nvarchar(100)
          N'Nhà Nước' , -- CapQL - nvarchar(30)
          4000.0 , -- KinhPhi - float
          '20061020' , -- NgayBD - date
          '20091020' , -- NgayKT - date
          'NCPT' , -- MaCD - varchar(10)
          '004'  -- GVCNDT - varchar(10)
        )


INSERT dbo.DETAI
        ( MaDT ,
          TenDT ,
          CapQL ,
          KinhPhi ,
          NgayBD ,
          NgayKT ,
          MaCD ,
          GVCNDT
        )
VALUES  ( '007' , -- MaDT - varchar(10)
          N'HTTT quản lý thư viện tại các trường đại học' , -- TenDT - nvarchar(100)
          N'Trường' , -- CapQL - nvarchar(30)
          20.0 , -- KinhPhi - float
          '20090510' , -- NgayBD - date
          '20100510' , -- NgayKT - date
          'QLGD' , -- MaCD - varchar(10)
          '001'  -- GVCNDT - varchar(10)
        )
		

-- CÔNG VIỆC
INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '001', -- MaDT - varchar(10)
          1, -- STT - int
          N'Khởi Tạo và lập kế hoạch', -- TenCV - nvarchar(50)
          '20071020', -- NgayBD - date
          '20081220'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '001', -- MaDT - varchar(10)
          2, -- STT - int
          N'Xác định yêu cầu', -- TenCV - nvarchar(50)
          '20081221', -- NgayBD - date
          '20080321'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '001', -- MaDT - varchar(10)
          3, -- STT - int
          N'Phân tích hệ thống', -- TenCV - nvarchar(50)
          '20080322', -- NgayBD - date
          '20080522'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '001', -- MaDT - varchar(10)
          4, -- STT - int
          N'Thiết kế hệ thống', -- TenCV - nvarchar(50)
          '20080523', -- NgayBD - date
          '20080623'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '001', -- MaDT - varchar(10)
          5, -- STT - int
          N'Cài đặt thử nghiệm', -- TenCV - nvarchar(50)
          '20060624', -- NgayBD - date
          '20081020'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '002', -- MaDT - varchar(10)
          1, -- STT - int
          N'Khởi Tạo và lập kế hoạch', -- TenCV - nvarchar(50)
          '20071020', -- NgayBD - date
          '20081220'  -- NgayKT - date
          )

  
 INSERT INTO    CONGVIEC( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '002', -- MaDT - varchar(10)
          2, -- STT - int
          N'Xác định yêu cầu', -- TenCV - nvarchar(50)
          '20081221', -- NgayBD - date
          '20080321'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '002', -- MaDT - varchar(10)
          3, -- STT - int
          N'Phân tích hệ thống', -- TenCV - nvarchar(50)
          '20080322', -- NgayBD - date
          '20080522'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '002', -- MaDT - varchar(10)
          4, -- STT - int
          N'Thiết kế hệ thống', -- TenCV - nvarchar(50)
          '20080523', -- NgayBD - date
          '20080623'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '002', -- MaDT - varchar(10)
          5, -- STT - int
          N'Cài đặt thử nghiệm', -- TenCV - nvarchar(50)
          '20060624', -- NgayBD - date
          '20081020'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '006', -- MaDT - varchar(10)
          1, -- STT - int
          N'Lấy Mẫu', -- TenCV - nvarchar(50)
          '20061020', -- NgayBD - date
          '20070220'  -- NgayKT - date
          )

INSERT dbo.CONGVIEC
        ( MaDT, STT, TenCV, NgayBD, NgayKT )
VALUES  ( '006', -- MaDT - varchar(10)
          2, -- STT - int
          N'Nuôi Cấy', -- TenCV - nvarchar(50)
          '20060624', -- NgayBD - date
          '20081020'  -- NgayKT - date
          )


-- THAM GIA ĐỀ TÀI
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '001', -- MaGV - varchar(10)
          '002', -- MaDT - varchar(10)
          1, -- STT - int
          0.0, -- PhuCap - float
          NULL  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '001', -- MaGV - varchar(10)
          '002', -- MaDT - varchar(10)
          2, -- STT - int
          2.0, -- PhuCap - float
          NULL  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '002', -- MaGV - varchar(10)
          '001', -- MaDT - varchar(10)
          4, -- STT - int
          2.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '003', -- MaGV - varchar(10)
          '001', -- MaDT - varchar(10)
          1, -- STT - int
          1.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '003', -- MaGV - varchar(10)
          '001', -- MaDT - varchar(10)
          2, -- STT - int
          0.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '003', -- MaGV - varchar(10)
          '001', -- MaDT - varchar(10)
          4, -- STT - int
          1.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )

INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '003', -- MaGV - varchar(10)
          '002', -- MaDT - varchar(10)
          2, -- STT - int
          0.0, -- PhuCap - float
          NULL  -- KetQua - nvarchar(10)
          )
	  
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '004', -- MaGV - varchar(10)
          '006', -- MaDT - varchar(10)
          1, -- STT - int
          0.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )
		  
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '004', -- MaGV - varchar(10)
          '006', -- MaDT - varchar(10)
          2, -- STT - int
          1.0, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )
		  
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '006', -- MaGV - varchar(10)
          '006', -- MaDT - varchar(10)
          2, -- STT - int
          1.5, -- PhuCap - float
          N'Đạt'  -- KetQua - nvarchar(10)
          )
		  
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '009', -- MaGV - varchar(10)
          '002', -- MaDT - varchar(10)
          3, -- STT - int
          0.5, -- PhuCap - float
          NULL  -- KetQua - nvarchar(10)
          )
		  
INSERT dbo.THAMGIADT
        ( MaGV, MaDT, STT, PhuCap, KetQua )
VALUES  ( '009', -- MaGV - varchar(10)
          '002', -- MaDT - varchar(10)
          4, -- STT - int
          1.5, -- PhuCap - float
          NULL  -- KetQua - nvarchar(10)
          )


-- NGƯỜI THÂN
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '001', -- MaGV - varchar(10)
          N'Hùng', -- Ten - nvarchar(100)
          '19900114', -- NgaySinh - date
          N'Nam'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '001', -- MaGV - varchar(10)
          N'Thủy', -- Ten - nvarchar(100)
          '19941208', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '003', -- MaGV - varchar(10)
          N'Hà', -- Ten - nvarchar(100)
          '19980903', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '003', -- MaGV - varchar(10)
          N'Thu', -- Ten - nvarchar(100)
          '19980903', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '007', -- MaGV - varchar(10)
          N'Mai', -- Ten - nvarchar(100)
          '20030326', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '007', -- MaGV - varchar(10)
          N'Vy', -- Ten - nvarchar(100)
          '20000214', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '008', -- MaGV - varchar(10)
          N'Nam', -- Ten - nvarchar(100)
          '19910506', -- NgaySinh - date
          N'Nam'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '009', -- MaGV - varchar(10)
          N'An', -- Ten - nvarchar(100)
          '19960819', -- NgaySinh - date
          N'Nam'  -- Phai - nvarchar(10)
          )
		  
INSERT dbo.NGUOITHAN
        ( MaGV, Ten, NgaySinh, Phai )
VALUES  ( '010', -- MaGV - varchar(10)
          N'Nguyệt', -- Ten - nvarchar(100)
          '20060114', -- NgaySinh - date
          N'Nữ'  -- Phai - nvarchar(10)
          ) 


-- GIÁO VIÊN ĐỀ TÀI
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '001', -- MaGV - varchar(10)
          '0838912112'  -- DienThoai - varchar(20)
          )

INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '001', -- MaGV - varchar(10)
          '0903123123'  -- DienThoai - varchar(20)
          )
		  
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '002', -- MaGV - varchar(10)
          '0913454545'  -- DienThoai - varchar(20)
          )

INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '003', -- MaGV - varchar(10)
          '0838121212'  -- DienThoai - varchar(20)
          )

INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '003', -- MaGV - varchar(10)
          '0903656565'  -- DienThoai - varchar(20)
          )
		  
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '003', -- MaGV - varchar(10)
          '0937125125'  -- DienThoai - varchar(20)
          )
		  
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '006', -- MaGV - varchar(10)
          '0937888888'  -- DienThoai - varchar(20)
          )
	  
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '008', -- MaGV - varchar(10)
          '0653717171'  -- DienThoai - varchar(20)
          )
		  
INSERT dbo.GV_DT
        ( MaGV, DienThoai )
VALUES  ( '008',-- MaGV - varchar(10)
          '0913232323'-- DienThoai - varchar(20)
          )


-- 
GO

UPDATE dbo.GIAOVIEN SET MaBM = 'MMT' WHERE MaGV='001'
UPDATE dbo.GIAOVIEN SET MaBM = 'HTTT' WHERE MaGV='002'
UPDATE dbo.GIAOVIEN SET MaBM = 'HTTT', GVQLCM = '002' WHERE MaGV='003'
UPDATE dbo.GIAOVIEN SET MaBM = 'VS' WHERE MaGV='004'
UPDATE dbo.GIAOVIEN SET MaBM = 'VLĐT' WHERE MaGV='005'
UPDATE dbo.GIAOVIEN SET MaBM = 'VS', GVQLCM='004' WHERE MaGV='006'
UPDATE dbo.GIAOVIEN SET MaBM = 'HPT' WHERE MaGV='007'
UPDATE dbo.GIAOVIEN SET MaBM = 'HPT', GVQLCM='007' WHERE MaGV='008'
UPDATE dbo.GIAOVIEN SET MaBM = 'MMT', GVQLCM='001' WHERE MaGV='009'
UPDATE dbo.GIAOVIEN SET MaBM = 'HPT', GVQLCM='007' WHERE MaGV='010'
--
GO

	SELECT * FROM dbo.GIAOVIEN
	SELECT * FROM dbo.KHOA
	SELECT * FROM dbo.BOMON
	SELECT * FROM dbo.CHUDE
	SELECT * FROM dbo.DETAI
	SELECT * FROM dbo.CONGVIEC
	SELECT *FROM dbo.THAMGIADT
	SELECT *FROM dbo.NGUOITHAN
	SELECT *FROM dbo.GV_DT
	-- 
	GO
    
	
-- Ví dụ  1
SELECT HoTen,Luong FROM dbo.GIAOVIEN
--ví dụ 2 
SELECT * FROM dbo.GIAOVIEN
--ví dụ 3
SELECT HoTen AS HoTenGV,Luong AS LuongGV FROM dbo.GIAOVIEN
--ví dụ 4
SELECT HoTen,Phai,Luong FROM dbo.GIAOVIEN
ORDER BY Luong DESC

--ví dụ 5
SELECT HoTen,MaBM,Luong FROM dbo.GIAOVIEN
ORDER BY MaBM, Luong DESC

--ví dụ 6
SELECT *FROM dbo.GIAOVIEN WHERE Luong > 50000
--ví dụ 7
SELECT * FROM dbo.GIAOVIEN WHERE Phai = N'Nam'
-- ví dụ 8
SELECT * FROM dbo.GIAOVIEN 
WHERE MaBM = 'HTTT' AND Luong > 40000
-- ví dụ 9
SELECT * FROM dbo.GIAOVIEN WHERE MaBM != 'HTTT' AND Luong <= 40000
--ví dụ 10
SELECT * FROM dbo.GIAOVIEN WHERE year(NgaySinh) BETWEEN 1955 AND 1960
--ví dụ 11
SELECT * FROM dbo.GIAOVIEN WHERE GVQLCM IS NULL
--ví dụ 12
SELECT *FROM dbo.GIAOVIEN WHERE GVQLCM IS NOT NULL
--ví dụ 13
--ví dụ 14
SELECT * FROM dbo.GIAOVIEN WHERE DiaChi LIKE N'%TP Hồ Chí Minh'
--ví dụ 15
SELECT * FROM dbo.DETAI WHERE DATEDIFF(d,NgayBD,'20050430') < 0
-- ví dụ 16
SELECT * FROM dbo.DETAI WHERE DATEDIFF(d,NgayKT,'20071231') > 7
--ví dụ 17
--ví dụ 18
SELECT HoTen,DATEDIFF(yyyy,NgaySinh,GETDATE()) AS Tuoi FROM dbo.GIAOVIEN
--ví dụ 19
SELECT * FROM dbo.GIAOVIEN WHERE year(NgaySinh)=1975
--ví dụ 20
SELECT Luong,Luong*1.1 AS LuongSau FROM dbo.GIAOVIEN
--ví dụ 21
SELECT dbo.DETAI.TenDT,year(NgayBD) AS NamBD FROM dbo.DETAI
ORDER BY year(NgayBD) DESC
--ví dụ 22
-- CÁCH 1
SELECT DISTINCT gv.*
FROM dbo.BOMON AS bm,dbo.GIAOVIEN AS gv,dbo.THAMGIADT AS tg
WHERE bm.TruongBM = tg.MaGV AND bm.TruongBM = gv.MaGV
-- CÁCH 2
SELECT DISTINCT dbo.GIAOVIEN.*
 FROM (dbo.BOMON JOIN dbo.THAMGIADT ON dbo.BOMON.TruongBM = dbo.THAMGIADT.MaGV)
 JOIN dbo.GIAOVIEN ON GIAOVIEN.MaGV = THAMGIADT.MaGV

 --ví dụ 23
 -- CÁCH 1
 SELECT GV.HoTen,BM.TenBM
 FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
 WHERE GV.MaBM = BM.MaBM 
 -- CÁCH 2
 SELECT dbo.GIAOVIEN.HoTen,dbo.BOMON.TenBM FROM dbo.GIAOVIEN JOIN dbo.BOMON 
 ON dbo.GIAOVIEN.MaBM = dbo.BOMON.MaBM

 -- ví dụ 24
 --CÁCH 1
 SELECT GV.HoTen,BM.TenBM
 FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
 WHERE GV.MaGV = BM.TruongBM

 -- CÁCH 2
 SELECT dbo.GIAOVIEN.HoTen,dbo.BOMON.TenBM FROM dbo.GIAOVIEN JOIN dbo.BOMON 
 ON dbo.GIAOVIEN.MaGV = dbo.BOMON.TruongBM
 ORDER BY MaGV ASC


 -- ví dụ 25
 SELECT dbo.KHOA.TenKhoa,dbo.GIAOVIEN.HoTen FROM dbo.GIAOVIEN, dbo.KHOA
WHERE dbo.GIAOVIEN.MaGV = dbo.KHOA.TruongKhoa

--ví dụ 26
SELECT dbo.GIAOVIEN.HoTen AS TenGV,dbo.NGUOITHAN.Ten AS TenNguoiThan FROM dbo.GIAOVIEN,dbo.NGUOITHAN 
WHERE dbo.GIAOVIEN.MaGV = dbo.NGUOITHAN.MaGV
-- ví dụ 27

SELECT G.HoTen AS HoTenGV, N.HoTen AS NguoiQuanLy 
FROM dbo.GIAOVIEN G,dbo.GIAOVIEN N
WHERE G.GVQLCM = N.MaGV
--ví dụ 28
-- CACH 1
SELECT GV.HoTen,K.TenKhoa
FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM,dbo.KHOA AS K
WHERE GV.MaBM = BM.MaBM AND BM.MaKhoa = K.MaKhoa

-- CACH 2
SELECT dbo.GIAOVIEN.HoTen,dbo.KHOA.TenKhoa FROM dbo.GIAOVIEN,dbo.KHOA,dbo.BOMON
WHERE dbo.GIAOVIEN.MaBM = dbo.BOMON.MaBM AND dbo.BOMON.MaKhoa = dbo.KHOA.MaKhoa

-- Cách 3
SELECT dbo.GIAOVIEN.HoTen,dbo.KHOA.TenKhoa
 FROM  (dbo.GIAOVIEN JOIN dbo.BOMON ON BOMON.MaBM = GIAOVIEN.MaBM)
JOIN dbo.KHOA 
ON dbo.BOMON.MaKhoa = dbo.KHOA.MaKhoa

-- ví dụ 29
SELECT dbo.GIAOVIEN.HoTen, dbo.BOMON.TenBM
FROM dbo.GIAOVIEN JOIN dbo.BOMON ON BOMON.MaBM = GIAOVIEN.MaBM
-- ví dụ 30

--	BÀI TẬP CHUYÊN ĐỀ
----------------------
--	Q1
SELECT HoTen,Luong FROM dbo.GIAOVIEN WHERE Phai='Nữ'
--	Q2
SELECT HoTen,Luong*1.1 AS LuongSau FROM dbo.GIAOVIEN
--	Q3
SELECT MaGV FROM dbo.GIAOVIEN
WHERE (dbo.GIAOVIEN.HoTen LIKE N'Nguyễn%' 
AND dbo.GIAOVIEN.Luong > 2000.0)
UNION -- Phép Hội
 SELECT MaGV FROM dbo.GIAOVIEN,dbo.BOMON
 WHERE  (dbo.GIAOVIEN.MaGV = dbo.BOMON.TruongBM AND YEAR(NgayNhanChuc) - 1995 > 0 )
 --	Q4
 SELECT dbo.GIAOVIEN.* FROM dbo.GIAOVIEN,dbo.BOMON 
 WHERE dbo.BOMON.MaKhoa  = 'CNTT' AND dbo.GIAOVIEN.MaBM = dbo.BOMON.MaBM
 --	Q5
 SELECT  dbo.BOMON.*,dbo.GIAOVIEN.* FROM
 dbo.GIAOVIEN JOIN dbo.BOMON ON BOMON.TruongBM = GIAOVIEN.MaGV

 --	Q6
 SELECT dbo.GIAOVIEN.*, dbo.BOMON.* 
 FROM dbo.GIAOVIEN JOIN dbo.BOMON ON BOMON.MaBM = GIAOVIEN.MaBM 

 --	Q7
 SELECT dbo.DETAI.TenDT, dbo.GIAOVIEN.*
 FROM dbo.DETAI JOIN dbo.GIAOVIEN ON GIAOVIEN.MaGV = DETAI.GVCNDT
 --	Q8
 SELECT K.TenKhoa,K.MaKhoa,K.TruongKhoa,GV.*  
 FROM dbo.KHOA AS K,dbo.GIAOVIEN AS GV
 WHERE GV.MaGV = K.TruongKhoa
 -- Q9
 SELECT DISTINCT GV.*
 FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM,dbo.THAMGIADT AS TG
 WHERE GV.MaBM = BM.MaBM AND BM.TenBM = N'Vi sinh' 
 AND TG.MaGV = GV.MaGV AND TG.MaDT='006'
 --Q10
 SELECT DT.MaDT, CD.TenCD,GV.HoTen AS 'GVCNDT',GV.NgaySinh,GV.DiaChi
 FROM dbo.DETAI AS DT,dbo.GIAOVIEN AS GV, dbo.CHUDE AS CD
 WHERE DT.CapQL=N'Trường' AND DT.MaCD = CD.MaCD AND GV.MaGV = DT.GVCNDT 
 -- Q11
 SELECT GV1.HoTen, GV2.HoTen
 FROM dbo.GIAOVIEN AS GV1,dbo.GIAOVIEN AS GV2
 WHERE GV2.MaGV = GV1.GVQLCM
 -- Q 12
 SELECT gv1.HoTen
 FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
 WHERE GV2.MaGV = GV1.GVQLCM AND GV2.HoTen = N'Nguyễn Thanh Tùng'
 -- q 13

 -- q 14

 ------
 SELECT *
 FROM dbo.GIAOVIEN AS gv
 WHERE gv.MaGV IN (SELECT bm.TruongBM
					FROM dbo.BOMON AS bm,dbo.THAMGIADT AS tg
					WHERE tg.MaGV = bm.TruongBM)

 SELECT *
 FROM dbo.GIAOVIEN AS gv
 WHERE gv.MaGV IN (SELECT bm.TruongBM
					FROM dbo.BOMON AS bm)
	AND gv.MaGV IN (SELECT tg.MaGV FROM dbo.THAMGIADT AS tg)

	SELECT *
	FROM dbo.GIAOVIEN AS gv 
	WHERE gv.MaGV IN (SELECT bm.TruongBM FROM dbo.BOMON AS bm) 


	--
	GO
    
SELECT COUNT(MaGV) AS SLGiaoVien
FROM dbo.GIAOVIEN
WHERE GVQLCM IS NOT NULL 

SELECT AVG(Luong) AS LuongTB
FROM dbo.GIAOVIEN
WHERE MaBM = 'HTTT' 


SELECT MaBM ,COUNT(*) AS SLGV
FROM dbo.GIAOVIEN
GROUP BY MaBM


SELECT MaGV,COUNT(*) AS SLCV
FROM dbo.THAMGIADT
GROUP BY MaGV

SELECT MaGV,COUNT(DISTINCT MaDT) AS SLDT
FROM dbo.THAMGIADT
GROUP BY MaGV

SELECT *
FROM dbo.GIAOVIEN

SELECT * 
FROM dbo.DETAI

SELECT gv.MaBM,COUNT(*) AS SL
FROM dbo.GIAOVIEN gv,dbo.DETAI dt
WHERE dt.GVCNDT = gv.MaGV
GROUP BY gv.MaBM

SELECT bm.TenBM,COUNT(*)
FROM dbo.GIAOVIEN gv,dbo.BOMON bm
WHERE gv.MaBM = bm.MaBM
GROUP BY bm.MaBM, bm.TenBM

SELECT MaBM
FROM dbo.GIAOVIEN
GROUP BY MaBM
HAVING COUNT(*) > 1

--SELECT gv.HoTen
--FROM dbo.GIAOVIEN gv,dbo.THAMGIADT tg
--WHERE gv.MaGV = tg.MaGV
--GROUP BY tg.MaGV
--HAVING COUNT(*)>2

SELECT * 
FROM dbo.GIAOVIEN
WHERE Luong > ANY(SELECT gv.Luong
				FROM dbo.GIAOVIEN gv,dbo.BOMON bm 
				WHERE gv.MaBM = bm.MaBM AND bm.MaBM = 'HTTT' )

SELECT gv1.*
FROM dbo.GIAOVIEN gv1
WHERE EXISTS (	SELECT * 
				FROM dbo.GIAOVIEN gv2
				WHERE gv1.Luong > gv2.Luong AND gv2.MaBM  = 'HTTT')

SELECT * FROM dbo.THAMGIADT

SELECT *
FROM dbo.GIAOVIEN gv
WHERE NOT EXISTS(SELECT * FROM dbo.THAMGIADT tg WHERE gv.MaGV = tg.MaGV)

SELECT *
FROM dbo.GIAOVIEN
WHERE MaGV IN (SELECT gv.MaGV FROM dbo.GIAOVIEN gv, dbo.BOMON bm,dbo.THAMGIADT tg
				WHERE gv.MaGV = bm.TruongBM AND gv.MaGV = tg.MaGV)


SELECT * FROM dbo.GIAOVIEN

SELECT gv.MaBM,COUNT(gv.MaGV) AS SLGV
FROM dbo.GIAOVIEN gv
GROUP BY gv.MaBM
HAVING COUNT(gv.MaGV) > 1

SELECT * FROM dbo.THAMGIADT

SELECT gv.MaGV,gv.HoTen,COUNT(DISTINCT tg.MaDT)AS SLDT
FROM dbo.GIAOVIEN gv JOIN dbo.THAMGIADT tg ON tg.MaGV = gv.MaGV
GROUP BY gv.MaGV,gv.HoTen
HAVING COUNT(DISTINCT tg.MaDT) > 1

SELECT YEAR(dt.NgayBD),COUNT(*) 
FROM dbo.DETAI dt
GROUP BY YEAR(dt.NgayBD)

/*--------------------BÀI TẬP ---------------------
---------------------------------------------------*/

--27

SELECT COUNT(GV.MaGV) AS SLGV,SUM(gv.Luong) AS Luong
 FROM dbo.GIAOVIEN GV

 --28
 SELECT gv.MaBM,COUNT(gv.MaGV) AS SLGV,AVG(gv.Luong) AS LTB
FROM dbo.GIAOVIEN gv
GROUP BY gv.MaBM
--29
SELECT * FROM dbo.DETAI
SELECT * FROM dbo.CHUDE
SELECT cd.TenCD,COUNT(DISTINCT dt.MaDT)AS SLDT 
FROM dbo.DETAI dt JOIN dbo.CHUDE cd ON cd.MaCD = dt.MaCD
GROUP BY cd.TenCD
--30
SELECT gv.MaGV,gv.HoTen,COUNT(DISTINCT tg.MaDT) AS SLDT
FROM dbo.THAMGIADT tg JOIN dbo.GIAOVIEN gv ON gv.MaGV = tg.MaGV
GROUP BY gv.HoTen,gv.MaGV
SELECT * FROM dbo.THAMGIADT
--31
SELECT * FROM dbo.DETAI
SELECT gv.MaGV,gv.HoTen,COUNT(dt.GVCNDT) AS SLDTQL
FROM dbo.GIAOVIEN gv JOIN dbo.DETAI dt ON dt.GVCNDT = gv.MaGV
GROUP BY gv.MaGV,gv.HoTen
--32
SELECT gv.HoTen,COUNT(nt.Ten) AS SLNT
FROM dbo.GIAOVIEN gv JOIN dbo.NGUOITHAN nt ON nt.MaGV = gv.MaGV
GROUP BY gv.HoTen
-- 33
SELECT gv.MaGV,COUNT(DISTINCT tg.MaDT) AS SLDT
FROM dbo.GIAOVIEN gv JOIN dbo.THAMGIADT tg ON tg.MaGV = gv.MaGV
GROUP BY gv.MaGV
HAVING COUNT(DISTINCT tg.MaDT) > 2
SELECT * FROM dbo.THAMGIADT
--34
SELECT dt.TenDT,COUNT(tg.MaGV) AS SLGV
FROM dbo.DETAI dt JOIN dbo.THAMGIADT tg ON tg.MaDT = dt.MaDT
WHERE dt.TenDT like N'%Ứng Dụng hóa học xanh%'
GROUP BY dt.TenDT

GO

/*----------------------- TRUY VẤN LỒNG---------------------
------------------------------------------------------------*/

--vd 1

SELECT * FROM dbo.GIAOVIEN
SELECT * FROM dbo.BOMON
--Cách 1
SELECT  gv.MaBM, COUNT(gv.MaGV) AS SLGV
FROM dbo.BOMON bm JOIN dbo.GIAOVIEN gv ON gv.MaBM = bm.MaBM
GROUP BY gv.MaBM
-- Cách 2
SELECT bm.MaBM,(SELECT COUNT(gv.MaGV ) AS SLGV 
				FROM dbo.GIAOVIEN gv 
				WHERE gv.MaBM = bm.MaBM 
				GROUP BY gv.MaBM )--HAVING COUNT(gv.MaGV) > 0) 
				
				AS SLGV 
FROM dbo.BOMON bm

--drop database QuanLyDeTai