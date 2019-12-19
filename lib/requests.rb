require 'pg'
require 'date'

class Requests

  CONNECTION = PG.connect(dbname: 'makersbnb')

  def initialize(user_id)
    @user_id = user_id
  end

  def user
    @user_id
  end

  def display_requests
    all_bookings = CONNECTION.exec("SELECT * FROM bookings")
    all_bookings.map { |booking| 
    "#{return_property_name(booking['prop_id'])[0]["prop_name"]}
     #{display_confirmation(confirmed?(booking['id'])[0]["confirmation"])}
     #{date_converter(start_date(booking['id'])[0]["startdate"])}  - #{date_converter(@requests.end_date(booking['id'])[0]["enddate"])}"
    }
  end

  # Return booking request list where your user ID is equal to the owner ID on the booking = Other users requesting your space.
  def my_space_requests
    my_space_requests = CONNECTION.exec("SELECT id FROM bookings WHERE owner_id='#{@user_id}'")
    return my_space_requests
  end

  # Return booking request list where your user ID is equal to the client ID on the booking = Requests you've made on spaces.
  def my_booking_requests
    my_booking_requests = CONNECTION.exec("SELECT id FROM bookings WHERE client_id='#{@user_id}'")
    return my_booking_requests
  end

  def property_name(property_ID)
    property_ID = 1
    property_name = CONNECTION.exec("SELECT prop_name FROM properties WHERE id='#{property_ID}'")
    return property_name
  end

  def confirmed?(booking_id)
    true_or_false = CONNECTION.exec("SELECT Confirmation FROM bookings WHERE id='#{booking_id}'")
    return true_or_false
  end

  def confirmation(confirmed)
    return "Confirmed" if confirmed == "t"
    return "Not Confirmed" if confirmed == "f"
  end

  def start_date(booking_id)
    start_date = CONNECTION.exec("SELECT startdate FROM bookings WHERE id='#{booking_id}'")
    return start_date
  end

  def end_date(booking_id)
    end_date = CONNECTION.exec("SELECT enddate FROM bookings WHERE id='#{booking_id}'")
  end

  def date_converter(date)

    # Convert the Date to a DateTime Object
    date_obj = DateTime.strptime(date,'%Y-%m-%d')

    format = date_obj.strftime('%d/%m/%Y')
    
    # Output the Date
    return format.to_s
  end
end