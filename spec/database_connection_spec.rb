
it 'this connection is persistent' do
  # Grab the connection as a return value from the .setup method
  connection = DatabaseConnection.setup('') #bookmark_manager_test

  expect(DatabaseConnection.connection).to eq connection
end