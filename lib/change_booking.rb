require 'pg'

class ChangeBookings

  def initialize
    @time = Time.now.strftime("Date Booked: %d / %m / %Y")
    @requests = ["Booking 1", "Booking 2", "Booking 3"]
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

  def time
    @time
  end

  def requests
    @requests
  end
end