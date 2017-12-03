
/*----------------------------------------------------------------------------------------------------------------------------

												I. Phần 1. TẠO CSDL VÀ NHẬP LIỆU

----------------------------------------------------------------------------------------------------------------------------*/

create database QuanLyDeAn1
go
use QuanLyDeAn1
----------------------------------------------------------TẠO BẢNG------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--1.Tạo bảng PHONGBAN
Create table PHONGBAN(
	MAPHG int not null,
	TENPHG nvarchar(30),
	TRPHG char(9),
	NG_NHANCHUC datetime,
	constraint PK_PHONGBAN primary key (MAPHG)
)
go
--2.Tạo bảng NHANVIEN
Create table NHANVIEN(
	MANV char(9) not null,
	HONV nvarchar(30),
	TENLOT nvarchar(30),
	TENNV nvarchar(30),
	NGSINH datetime,
	DCHI nvarchar(50),
	PHAI nchar(6),
	LUONG float,
	MA_NQL char(9),
	PHG int,
	constraint PK_NHANVIEN primary key (MANV)
)
go
--3.Tạo bảng DIADIEM_PHG
Create table DIADIEM_PHG(
	MAPHG int not null,
	DIADIEM nvarchar(30) not null,
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)
go
--4.Tạo bảng DEAN
Create table DEAN(
	MADA int not null,
	TENDA nvarchar(30),
	DDIEM_DA nvarchar(30),
	PHONG int, 
	constraint PK_DEAN primary key (MADA)
)
go
--5.Tạo bảng CONGVIEC
Create table CONGVIEC(
	MADA int not null,
	STT int not null,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_CONGVIEC primary key (MADA, STT)	
)
go
--6.Tạo bảng PHANCONG
Create table PHANCONG(
	MA_NVIEN char(9) not null,
	MADA int not null,
	STT int not null,
	THOIGIAN decimal(5, 1),
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA, STT)	
)
go
--7.Tạo bảng THANNHAN
Create table THANNHAN(
	MA_NVIEN char(9) not null,
	TENTN nvarchar(30) not null,
	PHAI nchar(6),
	NGSINH datetime,
	QUANHE nvarchar(16),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN)
)
go

----------------------------------------------------TẠO RÀNG BUỘC KHÓA NGOẠI--------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--1.Tạo khóa ngoại MA_NQL và MANV
Alter table NHANVIEN add constraint FK_NHANVIEN_NHANVIEN foreign key (MA_NQL) references NHANVIEN (MANV)
go
--2.Tạo khóa ngoại PHG và MAPHG
Alter table NHANVIEN add constraint FK_NHANVIEN_PHONGBAN foreign key (PHG) references PHONGBAN (MAPHG)
go
--3.Tạo khóa ngoại TRPHG và MANV
Alter table PHONGBAN add constraint FK_PHONGBAN_NHANVIEN foreign key (TRPHG) references NHANVIEN (MANV)
go
--4.Tạo khóa ngoại MAPHG (DIADIEM_PHG) và MAPHG (PHONGBAN)
Alter table DIADIEM_PHG add constraint FK_DIADIEM_PHG_PHONGBAN foreign key (MAPHG) references PHONGBAN (MAPHG)
go
--5.Tạo khóa ngoại PHONG và MAPHG
Alter table DEAN add constraint FK_DEAN_PHONGBAN foreign key (PHONG) references PHONGBAN (MAPHG)
go
--6.Tạo khóa ngoại MADA (CONGVIEC) và MADA (DEAN)
Alter table CONGVIEC add constraint FK_CONGVIEC_DEAN foreign key (MADA) references DEAN (MADA)
go
--7.Tạo khóa ngoại MADA, STT (PHANCONG) và MADA, STT (CONGVIEC)
Alter table PHANCONG add constraint FK_PHANCONG_CONGVIEC foreign key (MADA, STT) references CONGVIEC (MADA, STT)
go
--8.Tạo khóa ngoại MA_NVIEN (PHANCONG) và MANV (NHANVIEN)
Alter table PHANCONG add constraint FK_PHANCONG_NHANVIEN foreign key (MA_NVIEN) references NHANVIEN (MANV)
go
--9.Tạo khóa ngoại MA_NVIEN (THANNHAN) và MANV (NHANVIEN)
Alter table THANNHAN add constraint FK_THANNHAN_NHANVIEN foreign key (MA_NVIEN) references NHANVIEN (MANV)
go

------------------------------------------------TẠO RÀNG BUỘC MIỀN GIÁ TRỊ----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--1.Rang buoc mien gia tri PHAI
Alter table NHANVIEN add constraint CHK_NHANVIEN_PHAI check (PHAI in (N'Nam', N'Nữ'))
go
Alter table THANNHAN add constraint CHK_THANNHAN_PHAI check (PHAI in (N'Nam', N'Nữ'))
go

----------------------------------------------------------NHẬP LIỆU-----------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--1.Insert bảng PHONGBAN
Insert into PHONGBAN values (5, N'Nghiên cứu', null, '05/22/1978')
Insert into PHONGBAN values (4, N'Điều hành', null, '01/01/1985')
Insert into PHONGBAN values (1, N'Quản lý', null, '06/19/1971')
go
--2.Insert bảng NHANVIEN
Insert into NHANVIEN values ('009', N'Đinh', N'Bá', N'Tiên', '02/11/1960', N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, null, null)
Insert into NHANVIEN values ('005', N'Nguyễn', N'Thanh', N'Tùng', '08/20/1962', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, null, null)
Insert into NHANVIEN values ('007', N'Bùi', N'Ngọc', N'Hằng', '03/11/1954', N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, null, null)
Insert into NHANVIEN values ('001', N'Lê', N'Quỳnh', N'Như', '02/01/1967', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', 43000, null, null)
Insert into NHANVIEN values ('004', N'Nguyễn', N'Mạnh', N'Hùng', '03/04/1967', N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, null, null)
Insert into NHANVIEN values ('003', N'Trần', N'Thanh', N'Tâm', '05/04/1967', N'34 Mai Thị Lự, Tp HCM', N'Nam', 25000, null, null)
Insert into NHANVIEN values ('008', N'Trần', N'Hồng', N'Quang', '09/01/1967', N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, null, null)
Insert into NHANVIEN values ('006', N'Phạm', N'Văn', N'Vinh', '01/01/1965', N'45 Trưng Vương, Hà Nội', N'Nữ', 55000, null, null)
go
--3.Insert bảng DIADIEM_PHG
Insert into DIADIEM_PHG values (1, N'TP HCM')
Insert into DIADIEM_PHG values (4, N'Hà Nội')
Insert into DIADIEM_PHG values (5, N'Vũng Tàu')
Insert into DIADIEM_PHG values (5, N'Nha Trang')
Insert into DIADIEM_PHG values (5, N'TP HCM')
go
--4.Insert bảng DEAN 
Insert into DEAN values (1, N'Sản phẩm X', N'Vũng Tàu', 5)
Insert into DEAN values (2, N'Sản phẩm Y', N'Nha Trang', 5)
Insert into DEAN values (3, N'Sản phẩm Z', N'TP HCM', 5)
Insert into DEAN values (10, N'Tin học hóa', N'Hà Nội', 4)
Insert into DEAN values (20, N'Cáp quang', N'TP HCM', 1)
Insert into DEAN values (30, N'Đào tạo', N'Hà Nội', 4)
go
--5.Insert bảng CONGVIEC
Insert into CONGVIEC values (1, 1, N'Thiết kế sản phẩm X')
Insert into CONGVIEC values (1, 2, N'Thử nghiệm sản phẩm X')
Insert into CONGVIEC values (2, 1, N'Sản xuất sản phẩm Y')
Insert into CONGVIEC values (2, 2, N'Quảng cáo sản phẩm Y')
Insert into CONGVIEC values (3, 1, N'Khuyến mãi sản phẩm Z')
Insert into CONGVIEC values (10, 1, N'Tin học hóa nhân sự tiền lương')
Insert into CONGVIEC values (10, 2, N'Tin học hóa phòng kinh doanh')
Insert into CONGVIEC values (20, 1, N'Lắp đặt cáp quang')
Insert into CONGVIEC values (30, 1, N'Đào tạo nhân viên kinh doanh')
Insert into CONGVIEC values (30, 2, N'Đào tạo nhân viên thiết kế')
go
--6.Insert bảng PHANCONG
Insert into PHANCONG values ('009', 1, 1, 32)
Insert into PHANCONG values ('009', 2, 2, 8)
Insert into PHANCONG values ('004', 3, 1, 40)
Insert into PHANCONG values ('003', 1, 2, 20)
Insert into PHANCONG values ('003', 2, 1, 20)
Insert into PHANCONG values ('008', 10, 1, 35)
Insert into PHANCONG values ('008', 30, 2, 5)
Insert into PHANCONG values ('001', 30, 1, 20)
Insert into PHANCONG values ('001', 20, 1, 15)
Insert into PHANCONG values ('006', 20, 1, 30)
Insert into PHANCONG values ('005', 3, 1, 10)
Insert into PHANCONG values ('005', 10, 2, 10)
Insert into PHANCONG values ('005', 20, 1, 10)
Insert into PHANCONG values ('007', 30, 2, 30)
Insert into PHANCONG values ('007', 10, 2, 10)
go
--7.Insert bảng THANNHAN
Insert into THANNHAN values ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
Insert into THANNHAN values ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
Insert into THANNHAN values ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
Insert into THANNHAN values ('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
Insert into THANNHAN values ('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
Insert into THANNHAN values ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
Insert into THANNHAN values ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
go

------------------------------------------------------CẬP NHẬT DỮ LIỆU--------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

--1.Update bảng NHANVIEN
Update NHANVIEN Set MA_NQL = '005', PHG = 5 Where MANV = '009' 
Update NHANVIEN Set MA_NQL = '006', PHG = 5 Where MANV = '005' 
Update NHANVIEN Set MA_NQL = '001', PHG = 4 Where MANV = '007' 
Update NHANVIEN Set MA_NQL = '006', PHG = 4 Where MANV = '001' 
Update NHANVIEN Set MA_NQL = '005', PHG = 5 Where MANV = '004' 
Update NHANVIEN Set MA_NQL = '005', PHG = 5 Where MANV = '003' 
Update NHANVIEN Set MA_NQL = '001', PHG = 4 Where MANV = '008' 
Update NHANVIEN Set PHG = 1 Where MANV = '006' 
go
--2.Update bảng PHONGBAN
Update PHONGBAN Set TRPHG = '005' Where MAPHG = 5
Update PHONGBAN Set TRPHG = '008' Where MAPHG = 4
Update PHONGBAN Set TRPHG = '006' Where MAPHG = 1


/*----------------------------------------------------------------------------------------------------------------------------

												II. Phần 2. TRUY VẤN ĐƠN GIẢN VÀ PHÉP KẾT

----------------------------------------------------------------------------------------------------------------------------*/
--1 Tìm các nhân viên làm việc ở phòng số 4
select * from NHANVIEN where PHG = 4
--2.  Tìm các nhân viên có mức lương trên 30000
select * from NHANVIEN where LUONG > 30000
--3.  Tìm các nhân viên có mức lương trên 25,000  ở  phòng 4 hoặc các
-- nhân viên có mức lương trên 30,000 ở phòng 5
select * from NHANVIEN where (LUONG > 25000 and PHG = 4) or (LUONG > 30000 and PHG = 5)
--4.  Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
 select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as Ten , nv.DCHI as DIACHI 
 from  NHANVIEN nv
 where nv.DCHI LIKE N'%Tp HCM'
--5.  Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as Ten 
 from  NHANVIEN nv  
where nv.HONV LIKE 'N%'
--6.  Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as HoTen , nv.NGSINH as NgaySinh, nv.DCHI as DiaChi 
 from NHANVIEN nv 
where nv.HONV = N'Đinh' and nv.TENLOT = N'Bá' and nv.TENNV = N'Tiên' 
--7.  Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
select * from NHANVIEN where YEAR(NGSINH) between 1960 and 1965
--8.  Cho biết các nhân viên và năm sinh của nhân viên
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as Ten, YEAR(nv.NGSINH) as NamSinh from  NHANVIEN nv
--9.  Cho biết các nhân viên và tuổi của nhân viên

select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as Ten, (YEAR(GETDATE()) -  YEAR(nv.NGSINH)) as Tuoi 
from  NHANVIEN nv
--10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
select  p.TENPHG, p1.DIADIEM  
from PHONGBAN p, DIADIEM_PHG p1 
where p.MAPHG = p1.MAPHG
--11.Tìm tên những người trưởng phòng của từng phòng ban
select n.TENNV as TenTruongPhong, p.TENPHG as TenPB
 from NHANVIEN n, PHONGBAN p 
 where p.TRPHG = n.MANV
--12.Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu"
select n.TENNV as Ten ,n.DCHI as DiaChi  
from NHANVIEN n, PHONGBAN p 
where n.PHG = p.MAPHG and p.TENPHG = N'nghiên cứu'
--13.Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận
--chức của trưởng phòng của phòng ban chủ trì đề án đó
select d.TENDA as TenDeAn, p.TENPHG as TenPhongBan,
 p.NG_NHANCHUC as NgayNhanChuc, (n.HONV + ' ' + n.TENLOT + ' ' + n.TENNV ) as TenTP 
from DEAN d join PHONGBAN p on d.PHONG = p.MAPHG , NHANVIEN n
where d.DDIEM_DA = N'Hà Nội'and p.TRPHG = n.MANV
--14.Tìm tên những nữ nhân viên và tên người thân của họ
select n.TENNV as TenNV, n1.TENTN as TenNhanThan 
from NHANVIEN n join THANNHAN n1 on n.MANV = n1.MA_NVIEN 
where n.PHAI = N'Nữ'
--15.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp
--của nhân viên đó
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, 
(n.HONV + ' ' + n.TENLOT + ' ' + n.TENNV ) as TenNQL  
from  NHANVIEN nv join NHANVIEN n on nv.MA_NQL = n.MANV

--16.Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng
--và họ tên người quản lý trực tiếp của nhân viên đó

select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, 
(n.HONV + ' ' + n.TENLOT + ' ' + n.TENNV ) as TenNQL, 
(n2.HONV + ' ' + n2.TENLOT + ' ' + n2.TENNV ) as TentruongPhong  
from  NHANVIEN nv join NHANVIEN n on nv.MA_NQL = n.MANV, PHONGBAN p join NHANVIEN n2 on p.TRPHG = n2.MANV 
where nv.PHG = p.MAPHG

--17.Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X" và nhân
--viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp
select n.TENNV 
from NHANVIEN n join DEAN d on n.PHG = d.PHONG, NHANVIEN n2 
where n.PHG = 5 and d.TENDA = N'Sản Phẩm X' and n.MA_NQL = n2.MANV and 
n2.HONV = N'Nguyễn' and n2.TENLOT = N'Thanh' and n2.TENNV = N'Tùng' 

--18.Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, d.TENDA
from NHANVIEN nv join DEAN d on nv.PHG = d.PHONG
where nv.HONV = N'Đinh' and nv.TENLOT = N'Bá' and nv.TENNV = N'Tiên' 

-------------------------------------2.2 GOM NHOM -----------------------------------------------------------ctrl k ctrl c
--19.Cho biết số lượng đề án của công ty.
select count(d.MADA) as SOLUONGDEAN
from DEAN d
--20.Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì.
select d.PHONG, count(d.MADA) as SOLUONGDEAN, p.TENPHG as TENPHONG--select cai gi from cai do
from DEAN d join PHONGBAN p on d.PHONG = p.MAPHG
where p.TENPHG = N'nghiên cứu'
group by d.PHONG, p.TENPHG

--21.Cho biết lương trung bình của các nữ nhân viên.
select AVG(n.LUONG) as LUONGTB
from NHANVIEN n
where n.PHAI = N'Nữ'
--22.Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, count(t.TENTN) as SLTHANHNHAN
from NHANVIEN nv join THANNHAN t on nv.MANV = t.MA_NVIEN
where nv.HONV = N'Đinh' and nv.TENLOT = N'Bá' and nv.TENNV = N'Tiên' 
group by t.MA_NVIEN, nv.HONV, nv.TENLOT, nv.TENNV
--23.Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các
--nhân viên tham dự đề án đó.
select d.TENDA, sum(c.THOIGIAN) as THOIGIAN
from DEAN d join PHANCONG c on d.MADA = c.MADA
group by c.MADA, d.TENDA
--24.Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó. Xuất ra mã đề
--án, tên đề án và số lượng nhân viên tham gia.
select d.MADA, d.TENDA, count(c.MANV) as SONV
from (DEAN d join PHONGBAN p on d.PHONG = p.MAPHG) join NHANVIEN c on p.MAPHG = c.PHG
group by p.MAPHG, d.MADA, d.TENDA
--25.Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân
--viên đó.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, count(t.TENTN) as SLTHANHNHAN
from NHANVIEN nv join THANNHAN t on nv.MANV = t.MA_NVIEN
group by t.MA_NVIEN, nv.HONV, nv.TENLOT, nv.TENNV
--26.Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên
--đó đã tham gia.

select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNV, count(d.MADA) as SODA
from (DEAN d join PHONGBAN p on d.PHONG = p.MAPHG) join NHANVIEN nv on p.MAPHG = nv.PHG
group by nv.PHG, nv.HONV, nv.TENLOT, nv.TENNV
--27.Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực
--tiếp.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNVQL, count(nv.MANV) as SONV
from NHANVIEN n join NHANVIEN nv on n.MA_NQL = nv.MANV
group by n.MA_NQL, nv.HONV, nv.TENLOT, nv.TENNV
--28.Cho biết tên những nhân viên mà quản lý từ 2 nhân viên trở lên. Xuất ra họ, tên
--và tên phòng mà nhân viên đó làm việc.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TenNVQL, count(nv.MANV) as SONV, b.TENPHG as TENPHONG
from (NHANVIEN n join NHANVIEN nv on n.MA_NQL = nv.MANV) join PHONGBAN b on b.MAPHG = nv.PHG
group by n.MA_NQL, nv.HONV, nv.TENLOT, nv.TENNV, b.TENPHG
having count(nv.MANV) > 2
--29.Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân
--viên làm việc cho phòng ban đó.
select  b.TENPHG as TENPHONG, count(nv.MANV) as SONV, avg(nv.LUONG) as LUONGTB
from NHANVIEN nv join PHONGBAN b on b.MAPHG = nv.PHG
group by nv.PHG, b.TENPHG
--30.Với mỗi địa điểm, cho biết số lượng phòng ban tọa lạc tại địa điểm đó và số lượng---------------------------------
--đề án được triển khai tại địa điểm đó.

SELECT DD.DIADIEM, COUNT(DISTINCT DD.MAPHG) AS SLPB, COUNT(DISTINCT DA.MADA) AS SLDA
FROM DIADIEM_PHG DD, DEAN DA
WHERE DD.DIADIEM = DA.DDIEM_DA
GROUP BY DD.DIADIEM
--31.Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và
--số lượng nhân viên của phòng ban đó.
select  b.TENPHG as TENPHONG, count(nv.MANV) as SONV, avg(nv.LUONG) as LUONGTB
from NHANVIEN nv join PHONGBAN b on b.MAPHG = nv.PHG
group by nv.PHG, b.TENPHG
having avg(nv.LUONG) > 30000
--32.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó
--chủ trì.
select p.TENPHG as TENPHONGBAN, count(d.MADA) AS SLDEAN
from PHONGBAN p join DEAN d on p.MAPHG = d.PHONG
 group by p.MAPHG, p.TENPHG
--33.Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số
--lượng đề án mà phòng ban đó chủ trì.
select p.TENPHG as TENPHONGBAN, count(d.MADA) AS SLDEAN, (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ) as TENTRUONGPHONG
from (PHONGBAN p join DEAN d on p.MAPHG = d.PHONG) join NHANVIEN nv on  p.TRPHG = nv.MANV 
 group by p.MAPHG, p.TENPHG, nv.HONV, nv.TENLOT, nv.TENNV
--34.Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng
--ban và số lượng đề án mà phòng ban đó chủ trì.
select b.TENPHG as TENPHONG, count(DISTINCT nv.MANV) as SONV, avg(nv.LUONG) as LUONGTB--, count(d.MADA) AS SLDEAN
from (NHANVIEN nv join PHONGBAN b on b.MAPHG = nv.PHG) join DEAN d on d.PHONG = b.MAPHG
group by nv.PHG, b.TENPHG
having avg(nv.LUONG) > 40000

--35.Cho biết số đề án diễn ra tại từng địa điểm .

SELECT DD.DIADIEM, COUNT(DISTINCT DA.MADA) AS SLDA
FROM DIADIEM_PHG DD, DEAN DA
WHERE DD.DIADIEM = DA.DDIEM_DA
GROUP BY DD.DIADIEM
--36.Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
select d.TENDA, count(c.STT) as SLCV
from DEAN d join CONGVIEC c on d.MADA = c.MADA
group by c.MADA, d.TENDA
---37.Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng nhân viên
--được phân công.
select c.MADA, count(c.MA_NVIEN )as SLNV
from CONGVIEC d join PHANCONG c on d.STT = c.STT and d.MADA = c.MADA
where c.MADA = '30' 
group by c.MADA
--38.Với mỗi công việc trong đề án có tên đề án là 'Đào tạo', cho biết số lượng nhân
--viên được phân công cho công việc đó

select d1.TENDA, count(c.MA_NVIEN )as SLNV
from (CONGVIEC d join PHANCONG c on d.STT = c.STT and d.MADA = c.MADA) join DEAN d1 on  d.MADA = d1.MADA
where d1.TENDA LIKE N'Đào tạo' 
group by c.MADA, d1.TENDA


-----------------------------------------********-----------------------------------------------
--39.Cho biết danh sách các đề án (MADA) được phân công cho nhân viên có họ
--(HONV) là 'Đinh' hoặc có người trưởng phòng chủ trì đề án có họ (HONV) là 'Đinh'.
select p.MADA 
from NHANVIEN nv join PHANCONG p on nv.MANV = p.MA_NVIEN
where nv.HONV = N'Đinh' or nv.MANV in (select nv2.MANV
										from NHANVIEN nv2 join PHONGBAN b on b.TRPHG = nv2.MANV where nv2.HONV = N'Đinh')
--40.Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
select nv.HONV, nv.TENLOT, nv.TENNV, COUNT(t.MA_NVIEN) as SLTN
from NHANVIEN nv join THANNHAN t on nv.MANV = t.MA_NVIEN
group by t.MA_NVIEN, nv.HONV, nv.TENLOT, nv.TENNV
having COUNT(t.MA_NVIEN) > 2
--41.Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào.
select nv.HONV, nv.TENLOT, nv.TENNV, COUNT(t.MA_NVIEN) as SLTN
from NHANVIEN nv left join THANNHAN t on nv.MANV = t.MA_NVIEN
group by t.MA_NVIEN, nv.HONV, nv.TENLOT, nv.TENNV
having COUNT(t.MA_NVIEN)  = 0
--42.Cho biết những nhân viên (HONV, TENLOT, TENNV) có nhiều thân nhân nhất.
select nv.HONV, nv.TENLOT, nv.TENNV, COUNT(t.MA_NVIEN) as SLTN
from NHANVIEN nv left join THANNHAN t on nv.MANV = t.MA_NVIEN
group by t.MA_NVIEN, nv.HONV, nv.TENLOT, nv.TENNV
having COUNT(t.MA_NVIEN) >= ALL (select COUNT(t2.MA_NVIEN)
								from NHANVIEN nv2 left join THANNHAN t2 on nv2.MANV = t2.MA_NVIEN
								group by t2.MA_NVIEN)
--43.Cho biết địa điểm (DIADIEM) mà có nhiều phòng ban tọa lạc tại địa điểm đó nhất.
select d.DIADIEM, count(d.MAPHG) as SOPHONG
from DIADIEM_PHG d
group by d.DIADIEM
having count(d.MAPHG) >= ALL (select count(d1.MAPHG)
							from DIADIEM_PHG d1
							group by d1.DIADIEM)
--44.Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
select p.TRPHG, nv.HONV, nv.TENLOT, nv.TENNV, COUNT(t.MA_NVIEN) as SLTN
from (PHONGBAN p left join THANNHAN t on p.TRPHG = t.MA_NVIEN) join NHANVIEN nv on nv.MANV = p.TRPHG
group by t.MA_NVIEN, p.TRPHG, nv.HONV, nv.TENLOT, nv.TENNV
having COUNT(t.MA_NVIEN) >= 1
--45.Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
select p.TRPHG, nv.HONV, COUNT(t.MA_NVIEN) as SLTN
from (PHONGBAN p left join THANNHAN t on p.TRPHG = t.MA_NVIEN) join NHANVIEN nv on nv.MANV = p.TRPHG
group by t.MA_NVIEN, p.TRPHG, nv.HONV, nv.TENLOT, nv.TENNV
having COUNT(t.MA_NVIEN) = 0
--46.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu".
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV, nv.LUONG
from NHANVIEN nv
where nv.LUONG > (select AVG(nv2.LUONG)
					from NHANVIEN nv2 join PHONGBAN p on nv2.PHG = p.MAPHG
					where p.TENPHG = N'Nghiên cứu'
					group by nv2.PHG
					)
--47.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có lương lớn nhất.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV, nv.LUONG
from NHANVIEN nv
where nv.LUONG >= ALL (select (nv2.LUONG)
					from NHANVIEN nv2)
--48.Cho biết họ tên nhân viên có lương lớn nhất trong từng phòng ban.
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV, nv.LUONG, p1.TENPHG as TENPB
from NHANVIEN nv join PHONGBAN p1 on nv.PHG = p1.MAPHG
where nv.LUONG >= ALL (select (nv2.LUONG)
					from NHANVIEN nv2 join PHONGBAN p2 on nv2.PHG = p2.MAPHG
					where p1.MAPHG = p2.MAPHG)
--49.Cho biết tên những nhân viên vừa tham gia đề án “Đào Tạo” và đề án “Sản phẩm X”
select (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV
from    NHANVIEN nv 
where nv.MANV in (select p1.MA_NVIEN
					from   PHANCONG p1 join DEAN d1 on d1.MADA = p1.MADA 
					where d1.TENDA = N'Sản phẩm X'
					intersect
					select p2.MA_NVIEN
					from   PHANCONG p2 join DEAN d2 on d2.MADA = p2.MADA 
					where d2.TENDA = N'Đào tạo')
--50.Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
select p.TENPHG as TENPB, COUNT(nv.MANV) as SLNV, (n.HONV + ' ' + n.TENLOT + ' ' + n.TENNV) as HOTENTRUONGPHONG
from (PHONGBAN p join NHANVIEN nv on nv.PHG = p.MAPHG) join NHANVIEN n on p.TRPHG =n.MANV
group by nv.PHG, p.TENPHG, n.HONV, n.TENLOT, n.TENNV
having COUNT(nv.MANV) >= ALL( select COUNT(nv1.MANV)
							from PHONGBAN p1 join NHANVIEN nv1 on nv1.PHG = p1.MAPHG
							group by nv1.PHG)
--51.Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
--cách 1
select distinct p1.MADA
from   PHANCONG p1 
where  not exists(select p2.MADA
				from   PHANCONG p2
				where  p2.MA_NVIEN = '009' and p1.MADA = p2.MADA)
--cách 2
select distinct p1.MADA
from   PHANCONG p1 
where  p1.MADA not in(select p2.MADA
				from   PHANCONG p2
				where  p2.MA_NVIEN = '009')
--52.Cho biết danh sách các công việc (tên công việc) trong đề án 'Sản phẩm X' mà
--nhân viên có mã là 009 chưa làm.
select distinct c.TEN_CONG_VIEC, p1.MADA 
from   PHANCONG p1 join CONGVIEC c on c.MADA = p1.MADA
where  p1.MADA not in(select p2.MADA
				from   PHANCONG p2
				where  p2.MA_NVIEN = '009')
--53.Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm
--việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố 'TP HCM' .
select distinct nv.MANV, (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV, nv.DCHI
from NHANVIEN nv
where nv.MANV in (select d.MA_NVIEN
				from (DEAN da join PHANCONG d on da.MADA = d.MADA)
				where da.DDIEM_DA = 'TP HCM')
		and nv.PHG not in(select pb.MAPHG
						from PHONGBAN pb join DIADIEM_PHG d2 on pb.MAPHG = d2.MAPHG 
						where d2.DIADIEM = N'TP HCM')
--54.Tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố
--nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.
select distinct nv.MANV, (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as HOTENNV, nv.DCHI, d.DDIEM_DA
from (NHANVIEN nv join PHANCONG d1 on nv.MANV = d1.MA_NVIEN) join DEAN d on d1.MADA = d.MADA
where nv.PHG not in(select pb.MAPHG
					from PHONGBAN pb join DIADIEM_PHG d2 on pb.MAPHG = d2.MAPHG 
					where d2.DIADIEM = d.DDIEM_DA)


-------------------------------2.4 PHÉP CHIA --------------------------------

--55.Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án
--của công ty.
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv 
Where not exists (Select * From DEAN da
				  Where not exists (Select * From PHANCONG pc
									Where pc.MADA = da.MADA and pc.MA_NVIEN = nv.MANV))
--56.Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề
--án do phòng số 4 chủ trì.

Select distinct nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MA_NVIEN
where pc.MADA in (select da.MADA from DEAN da where da.PHONG = 4)
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV
Having count(distinct pc.MADA) = (Select count(*)
												From DEAN d
															where d.PHONG = 4)

--57.Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án mà
--nhân viên 'Đinh Bá Tiến' làm việc.
Select nvc.HONV, nvc.TENLOT, nvc.TENNV
From NHANVIEN nvc 
Where not exists (Select * 
				  From DEAN da join PHANCONG pc on da.MADA = pc.MADA
							   join NHANVIEN nv on nv.MANV = pc.MA_NVIEN
				  Where nv.HONV + nv.TENLOT + nv.TENNV like N'%Đinh%Bá%Tiên' 
				  and nvc.MANV not in (Select pc1.MA_NVIEN
								  From PHANCONG pc1
								  Where pc1.MADA = da.MADA and pc1.MA_NVIEN != nv.MANV))

--58.Cho biết những nhân được phân công cho tất cả các công việc trong đề án 'Sản
--phẩm X'.
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv
Where not exists (Select *
				  From DEAN da join CONGVIEC cv on da.MADA = cv.MADA 
				  Where da.TENDA = N'Sản phẩm X'
				  and nv.MANV not in(Select pc.MA_NVIEN 
								  From PHANCONG pc
								  Where pc.MADA = cv.MADA and cv.STT = pc.STT))
--59.Cho biết danh sách nhân viên tham gia vào tất cả các đề án ở TP HCM.

Select distinct nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MA_NVIEN
where pc.MADA in (select da.MADA from DEAN da where da.DDIEM_DA = N'TP HCM')
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV
Having count(distinct pc.MADA) = (Select count(*)
												From DEAN d
															where d.DDIEM_DA = N'TP HCM')
--60.Cho biết phòng ban chủ trì tất cả các đề án ở TP HCM.

/*Cach 1*/
select pb.MAPHG, pb.TENPHG
from PHONGBAN pb, DEAN da
where pb.MAPHG = da.PHONG and da.MADA in (select da1.MADA
											from DEAN da1
											where da1.DDIEM_DA = N'TP HCM'
											)
group by pb.MAPHG, pb.TENPHG
having COUNT(da.MADA) = (select COUNT(da1.MADA)
						from DEAN da1
						where da1.DDIEM_DA = N'TP HCM'	  
						)
/*Cach 2*/
select pb.MAPHG, pb.TENPHG
from PHONGBAN pb
where not exists (select da2.MADA
				from DEAN da2
				where 	da2.DDIEM_DA = N'TP HCM'
				except
				select da1.MADA
				from DEAN da1
				where  da1.DDIEM_DA = N'TP HCM' and pb.MAPHG = da1.PHONG)