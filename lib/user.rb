require 'pg'
require 'bcrypt'
require './spec/database_helpers'

class User

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.sign_up(name:, email:, password:)
    password = BCrypt::Password.create(password)
    connection = db_connection
    connection.prepare('statement1', 'INSERT INTO users(user_name, email, password_digest) VALUES($1, $2, $3) 
      RETURNING id, user_name, email, password_digest')
    result = connection.exec_prepared('statement1', [name, email, password])

    User.new(id: result[0]['id'], name: result[0]['user_name'], email: result[0]['email'], password: result[0]['password_digest'])
  end

  def self.sign_in(email:, password:)
    connection = db_connection
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}'")

    return false unless BCrypt::Password.new(result[0]['password_digest']) == password

    User.new(id: result[0]['id'], name: result[0]['user_name'], email: result[0]['email'], password: result[0]['password_digest'])
  end
  

end
