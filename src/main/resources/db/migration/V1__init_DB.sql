alter table if exists buckets_products drop constraint if exists FKloyxdc1uy11tayedf3dpu9lci
alter table if exists buckets_products drop constraint if exists FK2w8ke3rjix4jj9egl00nk1i64
alter table if exists carts drop constraint if exists FKb5o626f86h46m4s7ms6ginnop
alter table if exists order_details drop constraint if exists FKjyu2qbqt8gnvno9oe9j2s2ldk
alter table if exists order_details drop constraint if exists FK4q98utpd73imf4yhttm3w0eax
alter table if exists orders drop constraint if exists FK32ql8ubntj5uh44ph9659tiih
alter table if exists orders_details drop constraint if exists FKbblrq2kcscnyr9fsv8ptp98wy
alter table if exists orders_details drop constraint if exists FK5o977kj2vptwo70fu7w7so9fe
alter table if exists products_categories drop constraint if exists FKqt6m2o5dly3luqcm00f5t4h2p
alter table if exists products_categories drop constraint if exists FKtj1vdea8qwerbjqie4xldl1el
alter table if exists users drop constraint if exists FKdv26y3bb4vdmsr89c9ppnx85w
drop table if exists buckets_products cascade
drop table if exists carts cascade
drop table if exists categories cascade
drop table if exists order_details cascade
drop table if exists orders cascade
drop table if exists orders_details cascade
drop table if exists products cascade
drop table if exists products_categories cascade
drop table if exists users cascade
drop sequence if exists cart_seq
drop sequence if exists category_seq
drop sequence if exists order_details_seq
drop sequence if exists order_seq
drop sequence if exists user_seq
create sequence cart_seq start with 1 increment by 1
create sequence category_seq start with 1 increment by 1
create sequence order_details_seq start with 1 increment by 1
create sequence order_seq start with 1 increment by 1
create sequence user_seq start with 1 increment by 1
create table buckets_products
(
    bucket_id  bigint not null,
    product_id bigint not null
)
    --CART:
create table carts
(
    id      bigint not null,
    user_id bigint,
    primary key (id)
)
create table categories
(
    id    bigint not null,
    title varchar(255),
    primary key (id)
)
create table order_details
(
    id         bigint not null,
    amount     numeric(38, 2),
    price      numeric(38, 2),
    order_id   bigint,
    product_id bigint,
    primary key (id)
)
create table orders
(
    id           bigint not null,
    address      varchar(255),
    created_time timestamp(6),
    status       varchar(255),
    sum          numeric(38, 2),
    updated_time timestamp(6),
    user_id      bigint,
    primary key (id)
)
create table orders_details
(
    order_id   bigint not null,
    details_id bigint not null
)
create table products
(
    id    bigint not null,
    price numeric(38, 2),
    title varchar(255),
    primary key (id)
)
create table products_categories
(
    product_id  bigint not null,
    category_id bigint not null
)
create table users
(
    id           bigint  not null,
    archived     boolean not null,
    email        varchar(255),
    password     varchar(255),
    phone_number varchar(255),
    role         varchar(255),
    username     varchar(255),
    cart_id      bigint,
    primary key (id)
)
alter table if exists orders_details add constraint UK_kk6y3pyhjt6kajomtjbhsoajo unique (details_id)
alter table if exists buckets_products add constraint FKloyxdc1uy11tayedf3dpu9lci foreign key (product_id) references products
alter table if exists buckets_products add constraint FK2w8ke3rjix4jj9egl00nk1i64 foreign key (bucket_id) references carts
alter table if exists carts add constraint FKb5o626f86h46m4s7ms6ginnop foreign key (user_id) references users
alter table if exists order_details add constraint FKjyu2qbqt8gnvno9oe9j2s2ldk foreign key (order_id) references orders
alter table if exists order_details add constraint FK4q98utpd73imf4yhttm3w0eax foreign key (product_id) references products
alter table if exists orders add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users
alter table if exists orders_details add constraint FKbblrq2kcscnyr9fsv8ptp98wy foreign key (details_id) references order_details
alter table if exists orders_details add constraint FK5o977kj2vptwo70fu7w7so9fe foreign key (order_id) references orders
alter table if exists products_categories add constraint FKqt6m2o5dly3luqcm00f5t4h2p foreign key (category_id) references categories
alter table if exists products_categories add constraint FKtj1vdea8qwerbjqie4xldl1el foreign key (product_id) references products
alter table if exists users add constraint FKdv26y3bb4vdmsr89c9ppnx85w foreign key (cart_id) references carts