CREATE TABLE bookings(
  id SERIAL PRIMARY KEY,
  prop_id INTEGER REFERENCES properties(id),
  client_id INTEGER REFERENCES users(id),  
  owner_id INTEGER REFERENCES users(id),
  startdate date,
  enddate date,
  length_of_stay INTEGER,
  total_price INTEGER,
  confirmation BOOLEAN NOT NULL
);

-- example

-- insert into bookings(prop_id, client_id, owner_id, startdate,enddate, length_of_stay, total_price, confirmation)
-- VALUES
-- 	 (1, 2, 3,'2019-12-24', '2019-12-28', 4, 80, true);