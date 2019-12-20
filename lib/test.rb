require 'pg'

class Booking

  CONNECTION = PG.connect(dbname: 'makersbnb')

  def initialize(user_id = 1)
    @user_id = user_id
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