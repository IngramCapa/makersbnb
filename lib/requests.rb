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

  def my_selected_space_requests(booking_id)
    prop_id = CONNECTION.exec("SELECT prop_id FROM bookings WHERE id='#{booking_id}'")
    my_selected_space_requests = CONNECTION.exec("SELECT id FROM bookings WHERE prop_id='#{prop_id[0]["prop_id"]}'")
    return my_selected_space_requests
  end


  def property_name(booking_id)
    property_id = CONNECTION.exec("SELECT prop_id FROM bookings WHERE id='#{booking_id}'")
    property_name = CONNECTION.exec("SELECT prop_name FROM properties WHERE id='#{property_id[0]["prop_id"]}'")
    return property_name
  end

  def property_description(booking_id)
    property_id = CONNECTION.exec("SELECT prop_id FROM bookings WHERE id='#{booking_id}'")
    property_description = CONNECTION.exec("SELECT prop_description FROM properties WHERE id='#{property_id[0]["prop_id"]}'")
    return property_description
  end

  def confirmed?(booking_id)
    true_or_false = CONNECTION.exec("SELECT Confirmation FROM bookings WHERE id='#{booking_id}'")
    return true_or_false
  end

  def confirmation(confirmed)
    return "Confirmed" if confirmed == "t"
    return "Not Confirmed" if confirmed == "f"
  end

  def confirmation_yes(booking_id)
    CONNECTION.exec("UPDATE bookings SET Confirmation = 'TRUE' WHERE id='#{booking_id}'")
  end

  def confirmation_no(booking_id)
    CONNECTION.exec("UPDATE bookings SET Confirmation = 'FALSE' WHERE id='#{booking_id}'")
  end

  def start_date(booking_id)
    start_date = CONNECTION.exec("SELECT startdate FROM bookings WHERE id='#{booking_id}'")
    return start_date[0]["startdate"]
  end

  def end_date(booking_id)
    end_date = CONNECTION.exec("SELECT enddate FROM bookings WHERE id='#{booking_id}'")
    return end_date[0]["enddate"]
  end

  def client_name(booking_id)
    client_id = CONNECTION.exec("SELECT client_id FROM bookings WHERE id='#{booking_id}'")
    user_name = CONNECTION.exec("SELECT user_name FROM users WHERE id='#{client_id[0]["client_id"]}'")
    return user_name
  end

  def number_of_bookings(booking_id)
    client_id = CONNECTION.exec("SELECT client_id FROM bookings WHERE id='#{booking_id}'")
    booking_count = CONNECTION.exec("SELECT COUNT(id) FROM bookings WHERE id='#{client_id[0]["client_id"]}'")
    return booking_count[0]["count"].to_i
  end

  def date_converter(date)

    # Convert the Date to a DateTime Object
    date_obj = DateTime.strptime(date,'%Y-%m-%d')

    format = date_obj.strftime('%d/%m/%Y')
    
    # Output the Date
    return format.to_s
  end
end