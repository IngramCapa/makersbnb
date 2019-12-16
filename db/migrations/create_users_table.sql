CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL,
  email TEXT NOT NULL unique,
  password_digest TEXT NOT NULL
);