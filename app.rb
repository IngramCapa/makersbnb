require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './lib/bookings.rb'
require_relative './lib/requests.rb'
require_relative './lib/property.rb'

class MakersAirBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
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

  get '/requests/confirm' do
    erb :confirmation
  end

  run! if app_file == $0
end