CREATE TABLE bookings(
  id SERIAL PRIMARY KEY,
  prop_id INTEGER REFERENCES properties(id),
  client_id INTEGER REFERENCES users(id),  
  owner_id INTEGER REFERENCES users(id),
  startdate date(yyyy-mm-dd),
  enddate date(yyyy-mm-dd),
  length_of_stay INTEGER,
  total_price INTEGER,
  confirmation BOOLEAN NOT NULL
);