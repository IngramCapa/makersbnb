require 'pg'
require 'bcrypt'
require './spec/database_helpers'

class User

  attr_reader :id, :name, :email

  def initialize(id:, email:, name:, password_digest:)
    @id = id
    @name = name
    @email = email
    @password_digest = password_digest
  end


  def self.sign_up(name:, email:, password:)
    password_digest = BCrypt::Password.create(password)
    connection = db_connection
    connection.prepare('statement1', 'INSERT INTO users(user_name, email, password_digest) VALUES($1, $2, $3) 
      RETURNING id, user_name, email, password_digest')
    result = connection.exec_prepared('statement1', [name, email, password_digest])

    User.new(id: result[0]['id'], name: result[0]['user_name'], email: result[0]['email'], password_digest: result[0]['password_digest'])
  end

  

end
