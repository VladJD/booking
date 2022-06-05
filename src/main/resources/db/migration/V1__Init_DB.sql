create table event
(
    id             int8 generated by default as identity,
    resource_title varchar(255) not null,
    user_name      varchar(255) not null,
    start_time     date         not null,
    end_time       date         not null,
    primary key (id)
);
create table role
(
    id   int8 generated by default as identity,
    name varchar(255) not null,
    primary key (id)
);
create table users
(
    id       int8 generated by default as identity,
    login    varchar(255) not null,
    password varchar(255) not null,
    primary key (id)
);
create table users_roles
(
    user_id int8 not null,
    role_id int8 not null
);
alter table if exists users add constraint user_fk unique (login);
alter table if exists users_roles add constraint users_roles_role_fk foreign key (role_id) references role;
alter table if exists users_roles add constraint users_roles_users_fk foreign key (user_id) references users;