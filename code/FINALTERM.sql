

--De 1--
--1 cho biet (Manv, tennv) truong phong co Luong trung binh thap nhat 
select nv2.MANV, nv2.TENNV, avg(nv.LUONG) as 'Lương trung bình'
from (NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG)join NHANVIEN nv2 on nv2.MANV = pb.TRPHG
group by  nv2.MANV, nv2.TENNV
having avg(nv.LUONG) <= ALL (select avg(nv.LUONG)
													from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG
																							group by pb.MAPHG)

--2 cho biet (Manv, tennv) thuoc su quan li cua truong phong o cau 1 
select nv.MANV, nv.TENNV
from NHANVIEN nv 
where nv.MA_NQL in (select nv2.MANV
					from (NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG)join NHANVIEN nv2 on nv2.MANV = pb.TRPHG
					group by nv2.MANV, nv2.TENNV
					having avg(nv.LUONG) <= ALL (select avg(nv.LUONG)
													from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG
																							group by pb.MAPHG))

--3. cho biet (Manv, tennv) truong phong thuoc  pb co [sl nv tham gia het cac cv cua de an do pb co luong tb thap nhat] nhieu nhat
select nv3.MANV, nv3.TENNV
from NHANVIEN nv3 join PHONGBAN pb3 on pb3.TRPHG = nv3.MANV
where  nv3.MANV in (select count(*)
				from NHANVIEN nv2 
				where not exists (select * from CONGVIEC cv join DEAN da on cv.MADA= da.MADA -- all cv tu pb co ltb min
												where da.PHONG in (select pb.MAPHG
																	from (NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG)join NHANVIEN nv2 on nv2.MANV = pb.TRPHG
																	group by  pb.MAPHG
																	having avg(nv.LUONG) <= ALL (select avg(nv.LUONG)
																									from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG
																										group by pb.MAPHG))
												and not exists(
												select * from PHANCONG pc join DEAN da1 on pc.MADA= da1.MADA -- all nv tham gia da do pb do
												where cv.MADA = pc.MADA and pc.MA_NVIEN = nv2.MANV
												and cv.STT = pc.STT)))




