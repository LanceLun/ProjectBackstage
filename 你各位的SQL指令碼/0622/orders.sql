
create table [logistics_companies]
(Id int not null primary key identity(1,1),
[name] nvarchar(50),
tel varchar(12),
[logistics_description] nvarchar(50))

create table [order_statuses]
(Id int not null primary key identity(1,1),
order_status nvarchar(50))

create table [pay_methods]
(Id int not null primary key identity(1,1),
pay_method nvarchar(50))

create table [pay_statuses]
(Id int not null primary key identity(1,1),
pay_status nvarchar(50))

create table [closes]
(Id int not null primary key identity(1,1),
[close] bit,
close_date datetime)

create table [orders]
(Id int not null primary key identity(1,1),
[ordertime] datetime not null,
member_Id int not null,
foreign key(member_Id)references Members(MemberId),
total_quantity int not null,
logistics_company_Id int not null,
foreign key(logistics_company_Id)references logistics_companies(Id),
order_status_Id int not null,
foreign key(order_status_Id)references order_statuses(Id),
pay_method_Id int  not null,
foreign key(pay_method_Id)references pay_methods(Id),
pay_status_Id int not null,
foreign key(pay_status_Id)references pay_statuses(Id),
coupon_name nvarchar(50),
coupon_discount int,
freight int,
cellphone varchar(12) not null,
receipt varchar(50),
receiver nvarchar(50),
recipient_address nvarchar(50),
order_description nvarchar(50),
close_Id int,
foreign key(close_Id)references closes(Id))

create table [orderItems]
(Id int not null primary key identity(1,1),
order_Id int not null,
foreign key(order_Id)references orders(Id),
product_name nvarchar(50),
[type] nvarchar(50),
per_price int,
quantity int,
discount_name nvarchar(50),
subtotal int,
discount_subtotal int,
Items_description nvarchar(50))

