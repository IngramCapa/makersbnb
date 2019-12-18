require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './lib/bookings.rb'

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

  get '/sessions/new' do
    erb :sign_in
  end


  get '/spaces' do 
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
