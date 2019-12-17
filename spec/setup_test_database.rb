require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'name of database')

# Clear the bookmarks table
connection.exec("TRUNCATE bookmarks;")