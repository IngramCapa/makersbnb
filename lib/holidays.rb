require 'date'
# require class Property to get the price of it

class Holidays #Booking Class
  attr_reader :startDate, :endDate, :price

  def initialize(startDate, endDate, price)
    @startDate = Date.parse(startDate)
    @endDate = Date.parse(endDate)
    @price = price
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
end

# irb
holidays = Holidays.new('2019-12-30', '2020-01-11', 5)
puts "Total Night: #{holidays.calculateNight}"
puts "Total Price: #{holidays.totalPrice}£"
puts "CountDown until holidays: #{holidays.dayUntil}"
puts Date.today