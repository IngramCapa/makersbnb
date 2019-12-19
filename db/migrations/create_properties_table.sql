CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  prop_name VARCHAR(200),
  prop_description VARCHAR(2000),
  price_per_night INTEGER,
  startdate DATE,
  enddate DATE,
  owner_id INTEGER REFERENCES users(id)
    
);

-- example:

-- INSERT INTO properties(prop_name, prop_description, price_per_night, startdate, enddate)
-- VALUES
-- 	('makers house', 'old building in aldgate east', 20, '2019-12-17', '2019-12-31');
