require 'sinatra/base'
require 'date'
require 'json'
require_relative './lib/user.rb'
require_relative './lib/bookings.rb'
require_relative './lib/requests.rb'
require_relative './lib/user.rb'
require_relative './lib/property.rb'
require_relative './lib/holidays.rb'
require_relative './lib/change_booking.rb'
require_relative './lib/test.rb'

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
      # user_id: session[:user_id]
    )
    redirect :spaces
  end

  get '/spaces/dates' do
    erb :calendar
    @bookings = ChangeBookings.new
  end

  post '/dates' do
    $holiday = Holidays.new(params['startdate'], params['enddate'], 1)
    @bookings = ChangeBookings.new
    redirect '/spaces'
  end

  get '/requests' do
    @bookings = ChangeBookings.new
    @user_id = 1
    @requests = Requests.new(@user_id)
    erb :requests
  end
  
  get '/requests/confirmation/:id' do
    @selected_booking_id = params["id"]
    @bookings = ChangeBookings.new
    @@user_id = 1
    @requests = Requests.new(@user_id)
    erb :confirmation
  end
  
  get '/api/properties' do
    from = DateTime.parse(params[:datefrom])
    to = DateTime.parse(params[:dateto])
    requested_dates = Array(from..to)
    
    available_properties = Property.all.select do |p|
      prop_start_date = DateTime.parse(p.startdate)
      prop_end_date = DateTime.parse(p.enddate)
      available_dates = Array(prop_start_date..prop_end_date)
      
      requested_dates.all? { |date| available_dates.include? date }
    end

    available_properties.map(&:to_hash).to_json
  end

  get '/requests/confirmation/yes/:id' do
    @bookings = ChangeBookings.new
    @user_id = 1
    @requests = Requests.new(@user_id)
    erb :requests
  end

  get '/requests/confirmation/no/:id' do
    @bookings = ChangeBookings.new
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

  get '/spaces/dates/:id' do
   @@current_booking_id = params["id"]
   @bookings = Booking.new
   erb :calendar2
  end

  post '/spaces/dates/:id' do
    @@current_booking_id = params["id"]
    @bookings = Booking.new()
    @bookings.change_booking_start_date(@@current_booking_id, @bookings.date_converter(params['startdate']))
    @bookings.change_booking_end_date(@@current_booking_id,  @bookings.date_converter(params['enddate']))
    redirect 'requests'
  end

  get '/spaces/dates/:id' do
    @@current_booking_id = params["id"]
    @bookings = ChangeBookings.new
    erb :calendar
   end

  run! if app_file == $0
end