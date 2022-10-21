/*

Customers, oders, shipments
Author: Lucas Ruiz

*/

-- Create the database

Create schema example01;
use example01;

-- New table example01.customers

Create table customers (
    customers_id int(11) not null auto_increment,
    customers_name varchar(50) not null,
    primary key (customers_id)
);

-- New table example01.oders
create table oders 
(
    oder_id int(11) not null auto_increment,
    customer_id int(11) not null,
    order_date date not null,
    primary key (order_id, id),
    constraint fk_order_customer
	foreing key (customers_id) references customer(customer_id)
	on delete cascade on update cascade 
)

create table shipments (
shipment_id int(11) not null,
order_id int(11) not null,
customer_id int(11) not null,
shipment_date date not null,
primary key (customer_id, oder_id, shipment_id)
constraint fk_shipent_order_customer
foreing key (order_id, customer_id) references orders(order_id) customers(customer_id)
)
