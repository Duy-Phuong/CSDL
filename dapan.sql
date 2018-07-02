
--Cau 3
--select gv.magv
--from giaovien gv
--where gv.hoten like N'Nguyễn%' and
--gv.luong >2000
--union
--select b.truongbm
--from bomon b
--where year(b.ngaynhanchuc)>1975
--Cau 5
--select g.*
--from bomon b, giaovien g
--where b.truongbm=g.magv
--Cau 9
--select g.*
--from giaovien g, bomon b, thamgiadt d
--where g.mabm=b.mabm and g.magv=d.magv
--and b.tenbm = N'Vi sinh' and
--d.madt='006'
--Cau 12
--select gv.hoten
--from giaovien gv, giaovien gvql
--where gv.gvqlcm=gvql.magv
--and gvql.hoten=N'Trần Hoàng Nam'
--Cau 18
--select gvcungbm.hoten
--from giaovien gv, giaovien gvcungbm
--where gv.mabm=gvcungbm.mabm
--and gv.hoten = N'Trần Hoàng Nam'
--and gvcungbm.hoten <> N'Trần Hoàng Nam' 

/*----------------------------------------------------------------------------------------------------------------------------

													III. Phần 3. GOM NHÓM

----------------------------------------------------------------------------------------------------------------------------*/
--19.Cho biết số lượng đề án của công ty
Select COUNT(*) as 'Số lượng đề án'
From DEAN


-----------------------------------------------------------------------------------------------------------------------------
--20.Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
--Cách 1
Select COUNT(*) as 'Số lượng đề án'
From DEAN da join PHONGBAN pb on pb.MAPHG = da.PHONG
Where pb.TENPHG = N'Nghiên cứu'


-----------------------------------------------------------------------------------------------------------------------------
--21.Cho biết lương trung bình của các nữ nhân viên
Select AVG(nv.LUONG) as 'Lương trung bình'
From NHANVIEN nv
Where nv.PHAI = N'Nữ'


-----------------------------------------------------------------------------------------------------------------------------
--22.Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
--Cách 1
Select COUNT(tn.TENTN) as 'Số thân nhân'
From THANNHAN tn
Where tn.MA_NVIEN in (Select nv.MANV
					 From NHANVIEN nv
					 Where nv.HONV + nv.TENLOT + nv.TENNV like N'Đinh%Bá%Tiên')

--Cách 2
Select COUNT(tn.TENTN) as 'Số thân nhân'
From THANNHAN tn join (Select nv.MANV
					   From NHANVIEN nv
					   Where nv.HONV + nv.TENLOT + nv.TENNV like N'Đinh%Bá%Tiên') DBT on tn.MA_NVIEN = DBT.MANV

--Cách 3
Select COUNT(tn.TENTN) as 'Số thân nhân'
From THANNHAN tn join NHANVIEN nv on tn.MA_NVIEN = nv.MANV
Where nv.HONV + nv.TENLOT + nv.TENNV like N'Đinh%Bá%Tiên'


-----------------------------------------------------------------------------------------------------------------------------
--23.Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
Select da.TENDA as 'Tên đề án', SUM(pc.THOIGIAN) as 'Tổng thời gian'
From DEAN da join PHANCONG pc on da.MADA = pc.MADA 
Group by da.MADA, da.TENDA


-----------------------------------------------------------------------------------------------------------------------------
--25.Với mỗi nhân viên có số thân nhân lớn hơn 2, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
--Cách 1
Select nv.MANV as 'Mã nhân viên', nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Họ và tên nhân viên', COUNT(*) as 'Số thân nhân'
From NHANVIEN nv join THANNHAN tn on tn.MA_NVIEN = nv.MANV
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV
Having COUNT(*) > 2

--Cách 2
Select nv.MANV as 'Mã nhân viên', nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Họ và tên nhân viên', TEMP.SOTN as 'Số thân nhân'
From NHANVIEN nv join (Select tn.MA_NVIEN,COUNT(*) as SOTN
				   From THANNHAN tn
				   Group by tn.MA_NVIEN
				   Having COUNT(*)>2) TEMP on nv.MANV = TEMP.MA_NVIEN



-----------------------------------------------------------------------------------------------------------------------------
--26.Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
Select nv.MANV as 'Mã nhân viên', nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV as 'Họ và tên nhân viên', count(pc.MADA)
From NHANVIEN nv left join PHANCONG pc on nv.MANV = pc.MA_NVIEN
Group by nv.MaNV, nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV


-----------------------------------------------------------------------------------------------------------------------------
--27.Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
Select nvql.MANV, count(nv.MANV)
From NHANVIEN nvql left join NHANVIEN nv on nvql.MANV = nv.MA_NQL
Group by nvql.MANV



-----------------------------------------------------------------------------------------------------------------------------
--32.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì 
--yêu cầu xếp giảm dần theo số lượng đề án
Select pb.TENPHG, count(da.MADA)
From PHONGBAN pb left join DEAN da on pb.MAPHG = da.PHONG
Group by pb.MAPHG, pb.TENPHG
Order by count(da.MADA) desc


-----------------------------------------------------------------------------------------------------------------------------
--36.Với mỗi đề án, cho biết tên  đề án và số lượng công việc của đề án này.
Select da.TENDA, count(*) as SoCV 
From CONGVIEC cv, DEAN da
Where cv.MADA = da.MADA
Group by da.MADA, da.TENDA


-----------------------------------------------------------------------------------------------------------------------------
--38.Với mỗi công việc trong đề án có mã đề án 'Dao Tao', cho biết số lượng nhân viên được phân công .
Select cv.TEN_CONG_VIEC, count(pc.MA_NVIEN) as SoLuongNV
From CONGVIEC cv join DEAN da on cv.MADA = da.MADA
				 join PHANCONG pc on pc.MADA = cv.MADA and pc.STT = cv.STT
Where da.TENDA Like N'%Đào tạo%'
Group by cv.MADA, cv.STT, cv.TEN_CONG_VIEC


/*----------------------------------------------------------------------------------------------------------------------------

													IV. Phần 4. TRUY VẤN LỒNG

----------------------------------------------------------------------------------------------------------------------------*/
--39. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là 'Dinh' hoặc , 
--có người trưởng phòng chủ trì đề án với họ (HONV) là 'Dinh'.
select MADA
from DEAN
where MADA in ( select pc.MADA
		from NHANVIEN nv, PHANCONG pc
		where nv.MANV=pc.MA_NVIEN
		and nv.HONV=N'Đinh' )

   or MADA in ( select da.MADA
		from NHANVIEN nv, PHONGBAN pb, DEAN da
		where nv.MANV=pb.TRPHG
		and pb.MAPHG=da.PHONG
		and nv.HONV=N'Đinh' )


-----------------------------------------------------------------------------------------------------------------------------
--40.Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
select HONV, TENLOT, TENNV
from NHANVIEN nv
where ( select count(*) 
	from THANNHAN
	where MA_NVIEN = nv.MANV) > 2


-----------------------------------------------------------------------------------------------------------------------------
--41.Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào.
--Cach 1
select HONV, TENLOT, TENNV
from NHANVIEN nv
where ( select count(*) 
	from THANNHAN
	where MA_NVIEN = nv.MANV) = 0 

--Cach 2
select HONV, TENLOT, TENNV
from NHANVIEN nv
where not exists( 
	select *
	from THANNHAN
	where MA_NVIEN = nv.MANV) 

--Cach 3
select HONV, TENLOT, TENNV
from NHANVIEN nv
where nv.MANV not in( 
	select tn.MA_NVIEN
	from THANNHAN tn)



-----------------------------------------------------------------------------------------------------------------------------
--44. .Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
--Cach 1
select nv.HONV, nv.TENLOT, nv.TENNV
from PHONGBAN pb, NHANVIEN nv
where pb.TRPHG = nv.MANV and exists (
	select *
	from THANNHAN 
	where MA_NVIEN = pb.TRPHG)

--Cach 2
select HONV, TENLOT, TENNV
from NHANVIEN
where MANV in (select TRPHG from PHONGBAN)
  and MANV in (select MA_NVIEN from THANNHAN)
  
  
-----------------------------------------------------------------------------------------------------------------------------
--45.Tìm họ tên (HONV, TENNV) của những trưởng phòng chưa có gia đình.
--Cach 1
select HONV, TENLOT, TENNV
from NHANVIEN
where MANV in (select TRPHG from PHONGBAN)
  and MANV not in (select MA_NVIEN from THANNHAN where QuanHe=N'Vợ chồng')

--Cach 2
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHONGBAN pb on nv.MANV = pb.TRPHG
Where not exists (Select *
				  From THANNHAN tn
				  Where tn.MA_NVIEN = pb.TRPHG and tn.QUANHE = N'Vợ chồng')

-----------------------------------------------------------------------------------------------------------------------------
--46.Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) 
--có mức lương trên mức lương trung bình của phòng "Nghiên cứu"
select HONV, TENLOT, TENNV, LUONG, PHG
from NHANVIEN
where LUONG > (select avg(nv.LUONG)
		from NHANVIEN nv, PHONGBAN pb
		where nv.PHG=pb.MAPHG
		and pb.TENPHG=N'Nghiên cứu' )


-----------------------------------------------------------------------------------------------------------------------------
--50.Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
select nv.PHG, pb.TENPHG, tp.HONV + ' ' + tp.TENLOT + ' ' + tp.TENNV as TENTP, count(nv.MANV) as SOLUONG
from NHANVIEN nv, PHONGBAN pb, NHANVIEN tp 
where nv.PHG = pb.MAPHG and tp.MANV = pb.TRPHG
group by nv.PHG, pb.TENPHG, tp.HONV + ' ' + tp.TENLOT + ' ' + tp.TENNV
having count(nv.MANV) >= ALL(
	select count(*)
	from NHANVIEN
	group by PHG)


-----------------------------------------------------------------------------------------------------------------------------
--52.Cho biết danh sách các công việc (tên công việc) trong đề án ‘Sản phẩm X’ mà nhân viên có mã là 009 chưa làm.
insert into PHANCONG values('007', 10, 1, 10.0)

Select cv.TEN_CONG_VIEC
From CONGVIEC cv join DEAN da on cv.MADA = da.MADA
Where da.TENDA = N'Sản phẩm X' and not exists (Select * 
											   From PHANCONG pc
										       Where pc.MADA = cv.MADA and pc.STT = cv.STT and pc.MA_NVIEN = '009')
--
select TEN_CONG_VIEC
from CONGVIEC
where MADA in (select MADA
				from PHANCONG
				where MA_NVIEN = '009'
				and MADA in (select MADA from DEAN where TENDA like 'San pham X'))
and STT not in (select MADA
				from PHANCONG
				where MA_NVIEN = '009'
				and MADA in (select MADA from DEAN where TENDA like 'San pham X'))



-----------------------------------------------------------------------------------------------------------------------------
--53.Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở ‘TP HCM’ 
--nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố ‘TP HCM’ . 
--Cách 1
select HONV, TENLOT, TENNV, DCHI
from NHANVIEN nv 
where exists (	select * 
		from PHANCONG pc, DEAN da
		where pc.MADA = da.MADA and da.DDIEM_DA = N'TP HCM' and pc.MA_NVIEN=nv.MANV) and
     not exists(select *  
		from PHONGBAN pb, DIADIEM_PHG dd 
		where dd.MAPHG=pb.MAPHG and dd.DIADIEM ='TP HCM' and pb.MAPHG=nv.PHG) 

--Cách 2
select HONV, TENLOT, TENNV, DCHI
from NHANVIEN nv 
where nv.MANV in   (select pc.MA_NVIEN 
		    from PHANCONG pc, DEAN da
		    where pc.MADA = da.MADA and da.DDIEM_DA=N'TP HCM') and
     nv.PHG not in (select pb.MAPHG 
		    from PHONGBAN pb, DIADIEM_PHG dd 
		    where dd.MAPHG=pb.MAPHG and dd.DIADIEM=N'TP HCM') 


--55.Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án của công ty
insert into PHANCONG values('005',1,1,20)
insert into PHANCONG values('005',2,1,20)
insert into PHANCONG values('005',30,1,20)
--Cach 1 : phep chia
--KQ : nhanvien
--So chia : dean
--So bi chia : phancong
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv 
Where not exists (Select * From DEAN da
				  Where not exists (Select * From PHANCONG pc
									Where pc.MADA = da.MADA and pc.MA_NVIEN = nv.MANV))


--Cach 2 : gom nhom
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MA_NVIEN
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV
Having count(pc.MADA) = (Select count(*)
						 From DEAN )

-----------------------------------------------------------------------------------------------------------------------------
--57.Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án mà nhân viên ‘Đinh Bá Tiến’ làm việc
--Cach 1 : phep chia
--KQ : nhanvien
--So chia : dean
--So bi chia : phancong
Select nvc.HONV, nvc.TENLOT, nvc.TENNV
From NHANVIEN nvc 
Where not exists (Select * 
				  From DEAN da join PHANCONG pc on da.MADA = pc.MADA
							   join NHANVIEN nv on nv.MANV = pc.MA_NVIEN
				  Where nv.HONV + nv.TENLOT + nv.TENNV like N'%Đinh%Bá%Tiên'
				  and not exists (Select * 
								  From PHANCONG pc1
								  Where pc1.MADA = da.MADA and pc1.MA_NVIEN = nvc.MANV and pc1.MA_NVIEN != nv.MANV))

--Cach 2:
Select nvc.HONV, nvc.TENLOT, nvc.TENNV
From NHANVIEN nvc 
Where not exists (Select * 
				  From DEAN da join PHANCONG pc on da.MADA = pc.MADA
							   join NHANVIEN nv on nv.MANV = pc.MA_NVIEN
				  Where nv.HONV + nv.TENLOT + nv.TENNV like N'%Đinh%Bá%Tiên' 
				  and nvc.MANV not in (Select pc1.MA_NVIEN
								  From PHANCONG pc1
								  Where pc1.MADA = da.MADA and pc1.MA_NVIEN != nv.MANV))

--Cach 3: gom nhom
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MA_NVIEN
				 join DEAN da on da.MADA = pc.MADA
Where da.MADA in (Select pc1.MADA
			      From PHANCONG pc1 join NHANVIEN nv1 on nv1.MANV = pc1.MA_NVIEN
			      Where nv1.HONV + nv1.TENLOT + nv1.TENNV like N'%Đinh%Bá%Tiên' and nv1.MANV != nv.MANV)
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV
Having count(distinct da.MADA) = (Select count(distinct pc2.MADA)
								  From PHANCONG pc2 join NHANVIEN nv2 on nv2.MANV = pc2.MA_NVIEN
			      				  Where nv2.HONV + nv2.TENLOT + nv2.TENNV like N'%Đinh%Bá%Tiên')


-----------------------------------------------------------------------------------------------------------------------------
--58.Cho biết những nhân vien được phân công cho tất cả các công việc trong đề án ‘Sản phẩm X’
Insert into PHANCONG values('009',1,2,25)
Insert into PHANCONG values('003',1,1,25)
--Cach 1 : phep chia
--KQ : nhanvien
--So chia : dean, congviec
--So bi chia : phancong
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv
Where not exists (Select *
				  From DEAN da join CONGVIEC cv on da.MADA = cv.MADA 
				  Where da.TENDA = N'Sản phẩm X'
				  and not exists (Select * 
								  From PHANCONG pc
								  Where pc.MA_NVIEN = nv.MANV and pc.MADA = cv.MADA and cv.STT = pc.STT))

--Cach 2 : 
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv
Where not exists (Select *
				  From DEAN da join CONGVIEC cv on da.MADA = cv.MADA 
				  Where da.TENDA = N'Sản phẩm X'
				  and nv.MANV not in(Select pc.MA_NVIEN 
								  From PHANCONG pc
								  Where pc.MADA = cv.MADA and cv.STT = pc.STT))


--Cach 2: gom nhom
Select nv.HONV, nv.TENLOT, nv.TENNV
From NHANVIEN nv join PHANCONG pc on nv.MANV = pc.MA_NVIEN
				 join CONGVIEC cv on cv.MADA = pc.MADA and cv.STT = pc.STT
				 join DEAN da on da.MADA = pc.MADA
Where da.TENDA like N'Sản phẩm X' 
Group by nv.MANV, nv.HONV, nv.TENLOT, nv.TENNV, da.MADA
Having count(distinct cv.STT) = (Select count(cv1.STT)
								 From CONGVIEC cv1
								 Where cv1.MADA = da.MADA)
								 

