create database Transport_Management_System;
use Transport_Management_System;

create table Customers(
	customer_id int primary key auto_increment,
    customer_name varchar(120) not null,
    phone varchar(15) not null unique,
    email varchar(120) unique );
    
INSERT INTO customers (customer_name, phone, email) VALUES
('Amit Sharma', '9876543210', 'amit@gmail.com'),
('Rohit Patil', '9823456789', 'rohit@gmail.com'),
('Sneha Verma', '9811122233', 'sneha@gmail.com'),
('Vikas Gupta', '9898989898', 'vikas@gmail.com'),
('Neha Joshi', '9871234567', 'neha@gmail.com'),
('Raj Mehta', '9900112233', 'raj@gmail.com'),
('Kiran Yadav', '9812345678', 'kiran@gmail.com'),
('Pooja Singh', '9898123456', 'pooja@gmail.com'),
('Arjun Nair', '9888776655', 'arjun@gmail.com'),
('Priya Desai', '9877777777', 'priya@gmail.com'),
('Manish Jain', '9866666666', 'manish@gmail.com'),
('Sonal Shah', '9855555555', 'sonal@gmail.com'),
('Deepak Rao', '9844444444', 'deepak@gmail.com'),
('Anjali Kulkarni', '9833333333', 'anjali@gmail.com'),
('Ramesh Kumar', '9822222222', 'ramesh@gmail.com');

select * from customers;
 
 create table address(
	addres_id int primary key auto_increment,
    customer_id int not null,
    state varchar(120) not null,
    city varchar(99) not null,
    pincode bigint not null,
    foreign key(customer_id) references
    customers(customer_id));
    
INSERT INTO address (customer_id, city, state, pincode) VALUES
(1,'Mumbai','Maharashtra','400001'),
(2,'Pune','Maharashtra','411001'),
(3,'Delhi','Delhi','110001'),
(4,'Bangalore','Karnataka','560001'),
(5,'Kolkata','West Bengal','700001'),
(6,'Chennai','Tamil Nadu','600001'),
(7,'Hyderabad','Telangana','500001'),
(8,'Ahmedabad','Gujarat','380001'),
(9,'Jaipur','Rajasthan','302001'),
(10,'Vadodara','Gujarat','390001'),
(11,'Chandigarh','Punjab','160017'),
(12,'Nagpur','Maharashtra','440001'),
(13,'Srinagar','Jammu & Kashmir','190001'),
(14,'Navi Mumbai','Maharashtra','410206'),
(15,'Lucknow','Uttar Pradesh','226001');

select * from address;

create table vehicale(
	vehicale_id int primary key auto_increment,
    vehicale_number varchar(20) not null unique,
    vehical_type varchar(66) not null,
    capacity int not null);
    
INSERT INTO vehicale (vehicale_number, vehical_type, capacity) VALUES
('MH12AB1234','Truck',10000),
('MH14CD5678','Mini Truck',5000),
('DL01EF1122','Truck',12000),
('KA05GH3344','Trailer',20000),
('TN09IJ5566','Truck',15000),
('TS10KL7788','Mini Truck',6000),
('GJ11MN9900','Truck',14000),
('RJ14OP1111','Trailer',22000),
('PB08QR2222','Truck',13000),
('MH20ST3333','Mini Truck',7000),
('UP32UV4444','Truck',16000),
('HR26WX5555','Trailer',25000),
('AP09YZ6666','Truck',11000),
('MP04AA7777','Mini Truck',5500),
('KL07BB8888','Truck',14500);

select * from vehicale;

create table drivers(
	driver_id int primary key auto_increment,
    driver_name varchar(120) not null,
    phone varchar(15) not null unique,
    licence_number varchar(55) not null unique);
    
INSERT INTO drivers (driver_name, phone, licence_number) VALUES
('Ravi Kumar','9000000001','LIC1001'),
('Suresh Singh','9000000002','LIC1002'),
('Mahesh Patil','9000000003','LIC1003'),
('Ganesh Rao','9000000004','LIC1004'),
('Imran Khan','9000000005','LIC1005'),
('Nitin Yadav','9000000006','LIC1006'),
('Kamal Joshi','9000000007','LIC1007'),
('Ajay Verma','9000000008','LIC1008'),
('Farhan Ali','9000000009','LIC1009'),
('Sunil Mehta','9000000010','LIC1010'),
('Rohit Das','9000000011','LIC1011'),
('Vijay Shah','9000000012','LIC1012'),
('Arvind Nair','9000000013','LIC1013'),
('Prakash Jain','9000000014','LIC1014'),
('Deepak More','9000000015','LIC1015');

select * from drivers;

create table shipments(
	shipment_id int primary key auto_increment,
    customer_id int not null,
    vehicale_id int not null,
    driver_id int not null,
    source varchar(120) not null,
    destination varchar(120) not null,
    shipment_date date not null,
    status VARCHAR(33) DEFAULT 'BOOKED',
    foreign key (customer_id) references customers(customer_id),
    foreign key (vehicale_id ) references vehicale(vehicale_id),
    foreign key (driver_id) references drivers(driver_id) );
    

INSERT INTO shipments 
(customer_id, vehicale_id, driver_id, source, destination, shipment_date, status) VALUES
(1,1,1,'Mumbai','Pune','2026-03-01','DELIVERED'),
(2,2,2,'Pune','Delhi','2026-03-02','IN_TRANSIT'),
(3,3,3,'Delhi','Bangalore','2026-03-03','BOOKED'),
(4,4,4,'Bangalore','Chennai','2026-03-04','DELIVERED'),
(5,5,5,'Kolkata','Hyderabad','2026-03-05','IN_TRANSIT'),
(6,6,6,'Chennai','Mumbai','2026-03-06','BOOKED'),
(7,7,7,'Hyderabad','Ahmedabad','2026-03-07','DELIVERED'),
(8,8,8,'Ahmedabad','Jaipur','2026-03-08','BOOKED'),
(9,9,9,'Jaipur','Nagpur','2026-03-09','IN_TRANSIT'),
(10,10,10,'Nagpur','Lucknow','2026-03-10','DELIVERED'),
(11,11,11,'Lucknow','Delhi','2026-03-11','BOOKED'),
(12,12,12,'Delhi','Mumbai','2026-03-12','IN_TRANSIT'),
(13,13,13,'Mumbai','Chennai','2026-03-13','DELIVERED'),
(14,14,14,'Pune','Hyderabad','2026-03-14','BOOKED'),
(15,15,15,'Chennai','Bangalore','2026-03-15','DELIVERED');

select * from shipments;

create table payments(
	payment_id int primary key auto_increment,
    shipment_id int not null,
    amount decimal(10,2) not null,
    payment_date datetime DEFAULT CURRENT_TIMESTAMP, 
    payment_status varchar(44) DEFAULT 'PENDING',
    foreign key(shipment_id) references shipments(shipment_id) );
    
INSERT INTO payments (shipment_id, amount, payment_status) VALUES
(1,15000,'PAID'),
(2,20000,'PENDING'),
(3,18000,'PAID'),
(4,22000,'PAID'),
(5,25000,'PENDING'),
(6,17000,'PAID'),
(7,19000,'PAID'),
(8,21000,'PENDING'),
(9,23000,'PAID'),
(10,16000,'PAID'),
(11,24000,'PENDING'),
(12,26000,'PAID'),
(13,30000,'PAID'),
(14,28000,'PENDING'),
(15,32000,'PAID');

select * from payments;