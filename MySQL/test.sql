# Cấu trúc table
desc city;
# Tạo bảng mới
create table city;
# Tạo bảng từ bảng khác
create table city as select id, name from world.city;
# Lấy dữ liệu 1 hay nhiều cột
select name from city;		
select name, countrycode from city;
# Lấy dữ liệu tất cả các cột
select * from city;
# Lấy dữ liệu tất cả các cột 10 bản ghi
select * from city limit 10;
# Lấy dữ liệu tất cả các cột và lọc
select * from city where name = 'HCMC';
select * from city where name like 'C%' and population > 70000;
# sắp xếp dữ liệu
select * from city order by id limit 10;		
select * from city where name like 'C%' and population > 70000 order by id; # tăng dần
select * from city where name like 'C%' and population > 70000 order by desc; # giảm dần
# biến đổi dữ liệu
select upper(name) lower(name), name from city limit 3; # select 3 cột , in hoa, in thường, bình thường
# gom nhóm
select countrycode, count(*) from city group by countrycode; # gom nhóm và đếm xem có bao nhiêu 
select c.name c.population, c.countrycode, co.code, co.name from city c, country co where c.countrycode = co.code;
# thêm dữ liệu
insert into city values(1,'HCMC','100000');
insert into city select * from world.city; # đổ dữ liệu từ world city vào city
# cập nhật dữ liệu
update set name = 'Shanghai' where name = 'HCMC';
# xóa dữ liệu
delete from city where id = 2
# xóa hết dữ liệu
delete from city;

# tối ưu inx
create index inx_ngaygiaodich_namsinh on customers(ngay_giao_dich,nam_sinh);
explain select * from customers where ngay_giao_dich='2019-01-12';
# ấn inx đi
alter table customers alter	index inx_ngaygiaodich_namsinh invisible;
# PARTITION
ALTER TABLE customers
PARTITION BY RANGE (YEAR(ngaygiaodich))
(
    PARTITION p2018 VALUES LESS THAN (2019) ENGINE = InnoDB,
    PARTITION p2019 VALUES LESS THAN (2020) ENGINE = InnoDB,
    PARTITION p2020 VALUES LESS THAN (2021) ENGINE = InnoDB,
)