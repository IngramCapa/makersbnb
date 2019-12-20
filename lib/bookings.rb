require 'pg'
require './spec/database_helpers'

class Bookings
  attr_reader :id, :startDate, :endDate, :totalprice, :calculateNight

  def initialize(id, startDate, endDate, totalprice)
    @id = id
    @time = Time.now.strftime("Date Booked: %d / %m / %Y")
    @requests = ["Booking 1", "Booking 2", "Booking 3"]
    @startDate = Date.parse(startDate)
    @endDate = Date.parse(endDate)
    @totalprice = totalprice
  end

  def requests
    @requests
  end

  def time
    @time
  end

  def calculateNight
    (endDate - startDate).to_i
  end

  def totalPrice
    calculateNight * price.to_i
  end

  def dayUntil
    @startDate - Date.today
  end

  def self.create(startDate:, endDate:, totalprice:, calculateNight:)
    connection = db_connection

    connection.prepare('statement1','INSERT INTO bookings (startdate, enddate) 
                      VALUES($1, $2) 
                      RETURNING id, startdate, enddate')

    result = connection.exec_prepared('statement1', [startDate, endDate])

    Booking.new(
      id: result[0]['id'],
      startDate: result[0]['startdate'],
      enddate: result[0]['enddate'],
      totalPrice: result[0]['total_price'],
      calculateNight: result[0]['length_of_day']
    )
  end
end
