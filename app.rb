require 'sinatra/base'
require_relative './lib/bookings.rb'
require_relative './lib/user.rb'

class MakersAirBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @@user = User.new(params['name'], params['password'], params['email'])
    redirect '/spaces'
  end

  get '/sessions/new' do
  end

  get '/spaces' do 
    
    erb :spaces
  end

  get '/spaces/new' do
  end

  get '/spaces/dates' do
  end

  get '/requests' do
    @bookings = Bookings.new
    erb :requests
  end

  get '/requests/confirm' do
  end

  run! if app_file == $0
end