require 'sinatra/base'
require 'sinatra'
require './lib/holidays'

class MakersAirBnB < Sinatra::Base

  get '/' do
    erb(:calendar)
  end

  post '/dates' do
    $holiday = Holidays.new(params['startdate'], params['enddate'], 1)
    redirect '/confirm'
  end

  get '/confirm' do
    $holiday
    erb(:confirm)
  end

  run! if app_file == $0
end