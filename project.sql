# База данных предназначена для хранения информации о товарах, ресторанахи заказах пользователях сайта Бургер кинг.

create database burger_king;
use burger_king;

create table categories (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null,
 parent_id bigint unsigned default null);

insert into categories (name) values
('Другое'),
('Бургеры из говядины'),
('Бургеры из курицы и рыбы'),
('Креветки'),
('Закуски'),
('Салаты'),
('Напитки'),
('Десерты'),
('Завтраки'),
('Джуниор Обед');

create table delivery_methods (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null);

insert into delivery_methods (name) values
('В ресторане'),
('С собой'),
('Доставка');

create table media_types (
 id serial primary key,
 created_date timestamp null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(100) not null); 

insert into media_types (name) values
('other'),
('photo'),
('video'),
('link');

create table media (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null,
 filename varchar(255) not null,
 file_url varchar(255) not null,
 size decimal(10,0) not null,
 media_type_id bigint unsigned not null default '1',
 foreign key (media_type_id) references media_types (id)); 

insert into media (name, filename, file_url, size, media_type_id) values
('modi',	'1.jpgv',	'http://bernier.com/',	12,	1),
('asperiores',	'df.webm',	'http://www.abbott.com/',	543,	1),
('eveniet',	'drtr.vcf',	'http://www.durgan.com/',	34,	1),
('aut',	'dfd.sxg',	'http://beier.com/',	821609187,	1),
('tenetur',	'yt.bz',	'http://muller.com/',	294,	1),
('voluptatem',	'dfd.mathml',	'http://sipes.com/',	499713,	1),
('natus',	'dfdf.xif',	'http://www.reichert.com/',	8541088,	1),
('consequatur',	'dfe.flx',	'http://abbott.com/',	95788,	1),
('totam',	'dfdf.lostxml',	'http://www.paucekhaley.biz/',	42146716,	1),
('quod',	'fdfe.lac',	'http://wisoky.com/',	56543,	1);

create table coupons (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 number smallint unsigned not null unique,
 name varchar(255) not null,
 price decimal(6,2) not null,
 media_id bigint unsigned default null,
 foreign key (media_id) references media (id));

insert into coupons (number, name, price) values
(26012,	'ВОППЕР ДЖУНИОР + Напиток',	99.90),
(26023,	'ЦЕЗАРЬ КИНГ / ФИШ КИНГ КОМБО бургер на выбор, Кинг Фри,Напиток',	149.90),
(15212,	'15 КРЫЛЫШЕК',	299.99),
(26027,	'ЧИКЕН КИНГ + КИНГ ФРИ + НАПИТОК',	179.90);

create table stocks (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null,
 description text not null,
 finish_date timestamp null default null,
 media_id bigint unsigned default null,
 foreign key (media_id) references media (id));

insert into stocks (name, description) values
('ВОППЕР С ГРЕЧКОЙ, СТЕЙКХАУС СО СГУЩЕНКОЙ',	'"Мы в Бургер Кинге признательны всем, кто в эти дни продолжает заказывать любимые бургеры в Доставке и навынос. Нам захотелось сделать кое-что приятное в ответ — милый и очень актуальный презент, который сейчас точно не будет лишним! Мы запустили «Главную акцию года» — при покупке Воппера по специальному купону в мобильном приложении мы добавим к заказу пачку Гречки бесплатно! А при заказе Стейкхауса можно получить в подарок банку сгущённого молока."');

create table products_entity (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null);

insert into products_entity (name) values
('Лонг Чизбургер'),
('Сырный Джо'),
('Беконайзер'),
('ВОППЕР'),
('ВОППЕР с сыром'),
('ВОППЕР Джуниор'),
('Двойной ВОППЕР'),
('Тройной ВОППЕР'),
('Стейкхаус'),
('Pepsi'),
('Холодный чай (Лимон)'),
('Чикен Кинг'),
('Шримп Воппер'),
('Крылышки Кинг'),
('Салат «Цезарь»'),
('Кинг Фри');

create table restaurants_entity (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 address varchar(255) not null unique,
 phone bigint unsigned default null);

insert into restaurants_entity (address, phone) values
('ул. малая Филевская 13',	'4955445000');

create table roles (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null);

insert into roles (name) values
('Администратор'),
('Пользователь');

create table privileges (
 id serial primary key,
 create_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 name varchar(255) not null); 

insert into privileges (name) values
('Чтение записей категории'),
('Добавление записей категории'),
('Изменение записей категории'),
('Удаление записей категории'),
('Чтение записей рестораны'),
('Добавление записей рестораны'),
('Изменение записей рестораны'),
('Удаление записей рестораны'),
('Чтение записей продукты'),
('Добавление записей продукты'),
('Изменение записей продукты'),
('Удаление записей продукты');

create table roles_privileges (
 id serial primary key,
 role_id bigint unsigned not null,
 privilige_id bigint unsigned not null,
 foreign key (role_id) references roles (id),
 foreign key (privilige_id) references privileges (id)); 

insert into roles_privileges (role_id, privilige_id) values
(1,	1),
(1,	2),
(1,	3),
(1,	4),
(1,	5),
(1,	6),
(1,	7),
(1,	8),
(2,	1),
(2,	5);

create table users (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 entity_id bigint unsigned not null,
 login varchar(255) not null,
 password char(32) not null,
 email varchar(255) not null unique,
 first_name varchar(255) not null,
 last_name varchar(255) not null,
 phone bigint unsigned not null);

insert into users (entity_id, login, password, email, first_name, last_name, phone) values
(1,	'admin',	(select  MD5('admin')),	'admin@admin.ru',	'admin',	'admin',	79022344354),
(2,	'user',	(select  MD5('user')),	'user@user.ru',	'user',	'user',	79022345467),
(3,	'courier',	(select  MD5('courier')),	'courier@courier.ru',	'courier',	'courier',	79045465654),
(4,	'costumer',	(select  MD5('costumer')),	'costumer@costumer.ru',	'costumer',	'costumer',	79054546345),
(2,	'user1',	(select  MD5('user')),	'user1@courier.ru',	'user1',	'user1',	79045465654);

create table users_roles (
 id serial primary key,
 user_id bigint unsigned not null,
 role_id bigint unsigned not null,
 foreign key (user_id) references users (id),
 foreign key (role_id) references roles (id));

insert into users_roles (user_id, role_id) values
(1,	1),
(2,	2),
(5,	2);

create table products_version (
 id serial primary key,
 entity_id bigint unsigned not null,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 catalog_id bigint unsigned not null default '1',
 price decimal(6,2) not null,
 description text,
 weight decimal(5,2) not null default '0.00',
 kcal decimal(6,2) not null default '0.00',
 kdg decimal(6,2) not null default '0.00',
 proteins decimal(5,2) not null default '0.00',
 fats decimal(5,2) not null default '0.00',
 carbohydrates decimal(5,2) not null default '0.00',
 media_id bigint unsigned default null,
 user_id bigint unsigned not null,
 foreign key (catalog_id) references categories (id),
 foreign key (entity_id) references products_entity (id),
 foreign key (media_id) references media (id),
 foreign key (user_id) references users (id));


insert into products_version (entity_id, catalog_id, price, description, weight, kcal, kdg, proteins, fats, carbohydrates,user_id) values
(1, 2,	928.23,	'Occaecati.',	999.99,	336.20,	0.00,	64.59,	999.99,	999.99,	1),
(2, 2,	9999.99,	'Perspiciatis .',	999.99,	9999.99,	338.81,	30.00,	1.40,	999.99,	1),
(3, 2,	3856.42,	'Et eius.',	999.99,	5227.84,	9999.99,	1.13,	19.22,	0.24,	1),
(4, 2,	13.35,	'Quidem.',	999.99,	153.19,	6940.67,	2.94,	0.00,	999.99,	1),
(5, 2,	3337.83,	'Minus.',	999.99,	9999.99,	0.00,	2.63,	999.99,	999.99,	1),
(6, 2,	9999.99,	'Eos.',	58.74,	7603.85,	0.00,	999.99,	999.99,	2.01,	1),
(7, 2,	204.39,	'Occaecati.',	0.00,	0.18,	4783.05,	999.99,	21.33,	999.99,	1),
(8, 2,	36.04,	'Sit.',	999.99,	387.20,	3.17,	999.99,	0.30,	999.99,	1),
(9, 2,	59.35,	'Ut.',	0.00,	1.79,	9999.99,	999.99,	0.00,	999.99,	1),
(10, 7,	210.36,	'Ab voluptas.',	408.75,	7578.21,	9999.99,	999.99,	0.00,	999.99,	1),
(11, 7,	9999.99,	'Excepturi.',	496.94,	9999.99,	4632.40,	0.00,	999.99,	999.99,	1),
(12, 3,	1979.28,	'Tempore.',	269.48,	6.00,	505.74,	0.00,	0.00,	999.99,	1),
(13, 4,	9999.99,	'Eos.',	999.99,	3.07,	9999.99,	999.99,	999.99,	1.69,	1),
(14, 5,	32.80,	'Vitae.',	999.99,	3254.00,	459.38,	999.99,	0.00,	999.99,	1),
(15, 6,	4181.86,	'Et dolores.',	45.58,	9999.99,	9999.99,	999.99,	737.00,	999.99,	1),
(16, 5,	9999.99,	'Beatae.',	327.70,	9999.99,	9999.99,	999.99,	4.60,	999.99,	1);

create table coupons_products (
 id serial primary key,
 coupon_id bigint unsigned not null,
 product_id bigint unsigned not null,
 foreign key (product_id) references products_version (id),
 foreign key (coupon_id) references coupons (id));

insert into coupons_products (coupon_id, product_id) values
(1,	6),
(1,	10),
(1,	11),
(2,	14),
(3,	2),
(3,	13),
(3,	16),
(3,	10),
(3,	11),
(4,	12),
(4,	16),
(4,	10),
(4,	11);

create table restaurants_version (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 deleted_date timestamp null default null,
 entity_id bigint unsigned not null,
 start_time time not null default '08:00:00',
 end_time time not null default '22:00:00',
 wifi bit(1) not null default b'0',
 delivery bit(1) not null default b'0',
 auto bit(1) not null default b'0',
 user_id bigint unsigned not null,
 foreign key (entity_id) references restaurants_entity (id));

insert into restaurants_version (entity_id, start_time, end_time, wifi, delivery, auto, user_id) values
(1,	'08:00:00',	'22:00:00',	1,	1,	1,	1);

create table orders (
 id serial primary key,
 created_date timestamp not null default current_timestamp,
 customer_id bigint unsigned default null,
 courier_id bigint unsigned default null,
 address varchar(255) default null,
 delivery_method_id bigint unsigned not null default '1',
 price decimal(65,2) not null,
 paid bit(1) not null default b'0',
 restaurant_id bigint unsigned not null,
 foreign key (delivery_method_id) references delivery_methods (id),
 foreign key (customer_id) references users (id),
 foreign key (courier_id) references users (id),
 foreign key (restaurant_id) references restaurants_version (id));

insert into orders (customer_id, courier_id, address, delivery_method_id, price, paid, restaurant_id) values
(null,	null,	null,	1,	928.23,	1,	1),
(2,	3,	'Москва',	3,	13542.21,	0,	1),
(null,	null,	null,	1,	20204.37,	1,	1),
(2,	3,	'ул Профсоюзная 4',	3,	10095.38,	1,	1),
(null,	null,	null,	1,	928.23,	1,	1),
(2,	3,	'Москва',	3,	13542.21,	0,	1),
(null,	null,	null,	1,	20204.37,	1,	1),
(2,	3,	'ул Прафсоюзная 4',	3,	10095.38,	1,	1),
(null,	null,	null,	2,	212.70,	1,	1);

create table orders_products (
 id serial primary key,
 order_id bigint unsigned not null,
 product_id bigint unsigned default null,
 coupon_id bigint unsigned default null,
 foreign key (order_id) references orders (id),
 foreign key (product_id) references products_version (id),
 foreign key (coupon_id) references coupons (id));

insert into orders_products (order_id, product_id, coupon_id) values
(1,	1,	null),
(2,	5,	null),
(2,	6,	null),
(2,	7,	null),
(3,	6,	null),
(3,	7,	null),
(3,	11,	null),
(4,	2,	null),
(4,	8,	null),
(4,	9,	null),
(5,	14,	null),
(5,	null,	4);

create table warehouse (
 restaurant_id bigint unsigned not null,
 product_id bigint unsigned not null,
 count bigint unsigned not null,
 foreign key (restaurant_id) references restaurants_version (id),
 foreign key (product_id) references products_version (id));

insert into warehouse (restaurant_id, product_id, count) values
(1,	1,	100),
(1,	2,	100),
(1,	3,	100),
(1,	4,	100),
(1,	5,	100),
(1,	6,	100),
(1,	7,	100),
(1,	8,	100),
(1,	9,	100),
(1,	10,	100),
(1,	11,	100),
(1,	12,	100),
(1,	13,	100),
(1,	14,	100),
(1,	15,	100),
(1,	16,	100);

create or replace view popular_products (name, count) as
select pe.name AS name, count(*) kol
from orders o
join orders_products op on o.id = op.order_id
left join coupons_products cp on op.coupon_id = cp.coupon_id
left join products_version pv on op.product_id = pv.id or cp.product_id = pv.id and pv.deleted_date is null
join products_entity pe on pv.entity_id = pe.id
group by pe.name
order by kol desc
limit 10;

create or replace view restaurant_revenue (address, revenue) as
select re.address AS address, sum(o.price) sum
from orders o
join restaurants_version rv on o.restaurant_id = rv.id and rv.deleted_date is null
join restaurants_entity re on rv.entity_id = re.id
group by re.address;

delimiter //
create trigger create_user after insert on users 
for each row 
begin
	insert into users_roles (user_id, role_id) values (new.id, 2);
end//

create procedure create_products (name_prod varchar(255), 
	name_categorie varchar(255), price decimal(6,2), description varchar(255), weight decimal(5,2), 
	kcal decimal(6,2), kdg decimal(6,2), 
	proteins decimal(5,2), fats decimal(5,2), carbohydrates decimal(5,2))
begin
	declare `rollback` bit default 0;
	declare code varchar(255);
	declare error varchar(255);
	declare trunc_result varchar(255);
	declare prod_id bigint;
	declare categ_id bigint;
	declare continue handler for sqlexception
	begin
		set `rollback` = 1;
		get stacked diagnostics condition 1
			code = returned_sqlstate, error = message_text;
		set trunc_result = concat('Error: ', code, ' ,Text: ', error);
	end;

	set prod_id = (select id from products_entity where name = name_prod);
	set categ_id = (select id from categories where name = name_categorie);
	if categ_id is null then
		set categ_id = 1;
	end if;


	if prod_id is null then 
		insert into products_entity (name) values (name_prod);
		set prod_id = (select id from products_entity where name = name_prod);
	else
		update products_version set deleted_date = now() where entity_id = prod_id;
	end if;
	
	start transaction;
		insert into products_version (entity_id, catalog_id, price, description, weight, kcal, kdg, 
			proteins, fats, carbohydrates, user_id) values
			(prod_id, categ_id, price, description, weight, kcal, kdg, 
			proteins, fats, carbohydrates, categ_id);
		if `rollback` then
			rollback;
			select trunc_result;
		else
			commit;
			select 'Succes';
		end if;
end//

delimiter ;
call create_products('Шрип РОЛЛ', 'Бургговядины', 712, 'шрип ролл', 150, 340, 2100, 45, 120, 110);

delimiter //
create function get_product(func_product_id bigint, func_restaurant_id bigint) 
returns bit reads sql data
begin
	declare have_product bit;
	declare count_product int;
	set count_product = (select `count` from warehouse where product_id = func_product_id and restaurant_id = func_restaurant_id);
	if count_product > 0 then
		set have_product = 1;
	else
		set have_product = 0;
	end if;
	return have_product;
end//

delimiter //
create procedure create_order (proc_customer_id bigint, proc_courier_id bigint, proc_address varchar(255), 
	proc_delivery_method_id bigint, proc_price decimal(65,2), proc_paid bit(1), proc_restaurant_id bigint, 
	string_products varchar(255))
begin
	declare `rollback` bit default 0;
	declare code varchar(255);
	declare error varchar(255);
	declare trunc_result varchar(255);
	declare product varchar(255);
	declare proc_product_id varchar(255);
	declare proc_order_id bigint;
	declare i int;
	declare continue handler for sqlexception
	begin
		set `rollback` = 1;
		get stacked diagnostics condition 1
			code = returned_sqlstate, error = message_text;
		set trunc_result = concat('Error: ', code, ' ,Text: ', error);
	end;

	start transaction;
		insert into orders (customer_id, courier_id, address, delivery_method_id, price, paid, restaurant_id) values
		(proc_customer_id, proc_courier_id, proc_address, proc_delivery_method_id, proc_price, proc_paid, proc_restaurant_id);
		set proc_order_id = (select max(id) from orders);
	
		repeat
			set i = LOCATE('|',string_products);
			if i !=0 then
				set product = left(string_products, i-1);
			else
				set product = string_products;
			end if;
			set proc_product_id = 
				(select pv.id from products_version pv
				join products_entity pe on pv.entity_id = pe.id and pv.deleted_date is null
				where pe.name = product);
			if get_product(proc_product_id, proc_restaurant_id) then
				update warehouse set count = (count - 1) where product_id = proc_product_id and restaurant_id = proc_restaurant_id;
				insert into orders_products (order_id, product_id, coupon_id) values
				(proc_order_id, proc_product_id, null);
			else
				select concat('Нет товара c id=',proc_product_id);
			end if;
			set string_products = right(string_products, (char_length(string_products)-i));
		until i=0
		end repeat;
	
		if `rollback` then
			rollback;
			select trunc_result;
		else
			commit;
			select 'Succes';
		end if;
end//

delimiter ;
call create_order(null, null, null, 1, 456, 1, 1, 'ВОППЕР|Pepsi|Кинг Фри');
