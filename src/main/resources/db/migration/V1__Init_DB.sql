CREATE TABLE event
(
    id             BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    resource_title VARCHAR(255),
    user_name      VARCHAR(255),
    start_time     date,
    end_time       date,
    CONSTRAINT pk_event PRIMARY KEY (id)
);

CREATE TABLE role
(
    id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR(255),
    CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE users
(
    id       BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    login    VARCHAR(255),
    password VARCHAR(255),
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    role_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL
);

ALTER TABLE users
    ADD CONSTRAINT uc_users_login UNIQUE (login);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_role FOREIGN KEY (role_id) REFERENCES role (id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES users (id);