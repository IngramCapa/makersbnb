require 'sinatra/base'

class MakersAirBnB < Sinatra::base

  get '/' do
  end

  get '/sessions/new'
  end

  get '/spaces' do 
  end

  get '/spaces/new'
  end

  get '/spaces/dates'
  end

  get '/requests'
  erb :'requests'
  end

  get '/requests/confirm'
  end

  run! if app_file == $0
end