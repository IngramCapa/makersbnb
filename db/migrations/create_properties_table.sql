CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  prop_name VARCHAR(200),
  prop_description VARCHAR(2000),
  price_per_night INTEGER,
  startdate date(yyyy-mm-dd),
  enddate date(dd/mm/yyyy),
  owner_id INTEGER REFERENCES users(id)
    --   ts TIMESTAMP, maybe for sorting desc thru listings
);