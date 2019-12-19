class Bookings

  def initialize
    @time = Time.now.strftime("Date Booked: %d / %m / %Y")
    @requests = ["Booking 1", "Booking 2", "Booking 3"]
  end

  def requests
    @requests
  end

  def time
    @time
  end
end
