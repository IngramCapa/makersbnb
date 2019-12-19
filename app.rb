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
    erb :new_spaces
  end

  post '/spaces/new' do
    
    Property.create(prop_name: params['prop_name'], 
      prop_description: params['prop_description'], 
      price_per_night: params['price_per_night'], 
      startdate: params['startdate'], 
      enddate: params['enddate'],
      user_id: session[:user_id]
    )

    redirect :spaces
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