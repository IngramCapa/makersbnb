require 'sinatra/base'
<<<<<<< HEAD
require './lib/user'


class MakersAirBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
=======
require_relative './lib/bookings.rb'

class MakersAirBnB < Sinatra::Base

  get '/' do
  end

  get '/sessions/new' do
  end

  get '/spaces' do 
  end

  get '/spaces/new' do
>>>>>>> cabf442aea148c728a2b35bcdeb92a0377735a86
  end

  get '/spaces/dates' do
  end

  get '/requests' do
    @bookings = Bookings.new
    erb :'requests'
  end

  get '/requests/confirm' do
  end

  post '/users/sign_up' do
    user = User.sign_up(email: params['email'], password: params['password'])
    session[:user_id] = user.id
  end




  get '/users/space' do


  end 







  run! if app_file == $0
end


