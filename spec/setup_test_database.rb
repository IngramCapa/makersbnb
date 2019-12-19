# Tests should always run against an empty database. 
# We should set up any required Test data in the test itself. 
# Let's write a script that sets up and clears out the test database each run.

require 'pg'

p "Setting up test database..."

def setup_test_database 
    connection = PG.connect(dbname: 'makersbnb_test')

    # Clear the table
    connection.exec("TRUNCATE TABLE users CASCADE;")

end