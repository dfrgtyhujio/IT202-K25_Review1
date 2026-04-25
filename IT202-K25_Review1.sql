create database shop_management;
use shop_management;

create table customers (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    phone varchar(15),
    address varchar(255),
    customer_type enum('normal', 'vip') default 'normal'
);

create table products (
    id int primary key auto_increment,
    product_name varchar(100) not null,
    category varchar(50),
    price decimal(15, 2) not null,
    stock int default 0
);

create table orders (
    id int primary key auto_increment,
    customer_id int,
    order_date date,
    status enum('completed', 'cancelled') default 'completed',
    foreign key (customer_id) references customers(id)
);

create table order_details (
    id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int not null,
    total_price decimal(15, 2),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

insert into customers (full_name, phone, address, customer_type) values
	('nguyễn minh tâm', '0903123456', 'quận 1, tp.hcm', 'vip'),
	('phạm thanh sơn', '0912987654', 'đống đa, hà nội', 'vip'),
	('lê thị hồng hạnh', '0988111222', 'hải châu, đà nẵng', 'normal'),
	('trần hoàng bách', '0945333444', 'ninh kiều, cần thơ', 'normal'),
	('vũ bảo nam', '0355666777', 'ngô quyền, hải phòng', 'normal'),
	('đỗ thùy chi', '0322888999', 'tp. huế', 'normal'),
	('hoàng quốc anh', '0707123321', 'vĩnh hải, nha trang', 'normal');

insert into products (product_name, category, price, stock) values
	('điện thoại iphone 15 pro', 'điện tử', 28000000, 50),
	('laptop dell xps 13', 'điện tử', 32000000, 20),
	('tai nghe sony wh-1000xm5', 'điện tử', 8500000, 15),
	('áo thun cotton', 'thời trang', 250000, 100),
	('quần jean nam', 'thời trang', 550000, 80),
	('giày thể thao btis', 'thời trang', 890000, 40),
	('bàn làm việc gỗ', 'nội thất', 1200000, 10),
	('ghế xoay văn phòng', 'nội thất', 950000, 25),
	('đèn học để bàn', 'nội thất', 300000, 30),
	('radio cassette cổ', 'điện tử', 500000, 0);

insert into orders (customer_id, order_date, status) values
	(1, '2024-03-10', 'completed'),
	(2, '2024-03-11', 'completed'),
	(3, '2024-03-12', 'completed'),
	(4, '2024-03-13', 'completed'),
	(5, '2024-03-14', 'cancelled');

insert into order_details (order_id, product_id, quantity, total_price) values
	(1, 1, 1, 28000000),
    (1, 2, 1, 32000000),
    (1, 4, 2, 500000),
	(2, 3, 1, 8500000),
    (2, 5, 1, 550000),
	(3, 1, 1, 28000000),
    (3, 6, 2, 1780000),
    (3, 7, 1, 1200000),
	(4, 8, 3, 2850000),
    (4, 9, 2, 600000),
	(5, 1, 1, 28000000),
    (5, 2, 1, 32000000);

update products 
set stock = stock - 5 
where id = 1;