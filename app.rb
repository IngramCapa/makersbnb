require 'sinatra/base'
require_relative './lib/bookings.rb'
require_relative './lib/requests.rb'


class MakersAirBnB < Sinatra::Base

  get '/' do
  end

  post '/' do
    @@user = User.new(params['name'], params['password'], params['email'])
    redirect '/spaces'
  end

  get '/sessions/new' do
  end

  get '/spaces' do 
    erb :'spaces'
  end

  get '/spaces/new' do
  end

  get '/spaces/dates' do
  end

  get '/requests' do
    @bookings = Bookings.new
    @user_id = 1
    @requests = Requests.new(@user_id)
    erb :requests
  end

  get '/requests/confirm' do
    erb :confirmation
  end

  run! if app_file == $0
end