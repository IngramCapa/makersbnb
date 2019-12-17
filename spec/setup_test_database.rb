<<<<<<< HEAD
=======
# Tests should always run against an empty database. 
# We should set up any required Test data in the test itself. 
# Let's write a script that sets up and clears out the test database each run.

>>>>>>> cabf442aea148c728a2b35bcdeb92a0377735a86
require 'pg'

p "Setting up test database..."

<<<<<<< HEAD
connection = PG.connect(dbname: 'name of database')

# Clear the bookmarks table
connection.exec("TRUNCATE bookmarks;")
=======
def setup_test_database 
    connection = PG.connect(dbname: 'makersbnb_test')

    # Clear the table
    connection.exec("TRUNCATE properties;")

end
>>>>>>> cabf442aea148c728a2b35bcdeb92a0377735a86
