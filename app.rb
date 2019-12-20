require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './lib/bookings.rb'
require_relative './lib/requests.rb'
require_relative './lib/user.rb'
require_relative './lib/property.rb'

class MakersAirBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    @@user = User.new(params['name'], params['password'], params['email'])
  end
  
  post '/sign_up' do
    user = User.sign_up(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  post '/' do
    @@user = User.new(params['name'], params['password'], params['email'])
    redirect '/spaces'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/spaces')
  end

  get '/spaces' do 
    erb :'spaces'
    @properties = Property.all
    erb :spaces
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
  
  get '/requests/confirmation/:id' do
    @selected_booking_id = params["id"]
    @bookings = Bookings.new
    @@user_id = 1
    @requests = Requests.new(@user_id)
    erb :confirmation
  end

  get '/requests/confirmation/yes/:id' do
    @bookings = Bookings.new
    @user_id = 1
    @requests = Requests.new(@user_id)
    erb :requests
  end

  get '/requests/confirmation/no/:id' do
    @bookings = Bookings.new
    @user_id = 1
    @requests = Requests.new(@user_id)
    erb :requests
  end

  post '/requests/confirmation/yes/:id' do
    @requests = Requests.new(@@user_id)
    @requests.confirmation_yes(params["id"])
    redirect '/requests'
  end

  post '/requests/confirmation/no/:id' do
    @requests = Requests.new(@@user_id)
    @requests.confirmation_no(params["id"])
    redirect '/requests'
  end


  run! if app_file == $0
end