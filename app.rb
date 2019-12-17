require 'sinatra/base'
require_relative './lib/bookings.rb'
require_relative './lib/property.rb'

class MakersAirBnB < Sinatra::Base

  get '/' do
  end

  get '/sessions/new' do
  end

  get '/spaces' do 
    @properties = Property.all
    erb :spaces
  end

  get '/spaces/new' do
  end

  get '/spaces/dates' do
  end

  get '/requests' do
    @bookings = Bookings.new
    erb :'requests'
  end

  get '/requests/confirm' do
  end

  run! if app_file == $0
end