INSERT INTO users(id, archived, email, username, password, role, cart_id)
VALUES (1, false, 'maiL@mail.org', 'admin', 'password', 'ADMIN', null);

ALTER SEQUENCE user_seq RESTART WITH 2;