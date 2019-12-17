CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL,
  email TEXT NOT NULL unique,
  password_digest TEXT NOT NULL
);

-- example:

-- INSERT INTO users(user_name, email, password_digest)
-- VALUES
--    ('name3', 'name3@mail.com', 'test');