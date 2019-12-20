require 'pg'

class ChangeBookings

  CONNECTION = PG.connect(dbname: 'makersbnb')

  def initialize(user_id = 1)
    @user_id = user_id
  end

  def booking_property_name(booking_id)
    prop_id = CONNECTION.exec("SELECT prop_id FROM bookings WHERE id='#{booking_id}'")
    prop_name = CONNECTION.exec("SELECT prop_name FROM bookings WHERE id='#{prop_id[0]["prop_id"]}'")
    return prop_name[0]["prop_name"]
  end

  def change_booking_start_date(booking_id, date)
    CONNECTION.exec("UPDATE bookings SET startdate = '#{date}' WHERE id='#{booking_id}'")
  end

  def change_booking_end_date(booking_id, date)
    CONNECTION.exec("UPDATE bookings SET enddate = '#{date}' WHERE id='#{booking_id}'")
  end

  def date_converter(date)

    # Convert the Date to a DateTime Object
    date_obj = DateTime.strptime(date,'%d/%m/%Y')

    format = date_obj.strftime('%Y-%m-%d')
    
    # Output the Date
    return format.to_s
  end
end