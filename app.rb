require 'sinatra/base'
require './lib/user'


class MakersAirBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  

  post '/users/sign_up' do
    user = User.sign_up(email: params['email'], password: params['password'])
    session[:user_id] = user.id
  end




  get '/users/space' do


  end 







  run! if app_file == $0
end


