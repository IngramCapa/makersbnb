require 'bookings'

describe Bookings do
  describe ".create" do
    it('should return a new booking') {
      bookings = Bookings.create(startdate: '2019-12-20', enddate: '2019-12-24', totalPrice: 20)

      expect(bookings).to be_a Bookings
      expect(bookings.startdate).to eq("2019-12-20")
      expect(bookings.enddate).to eq("2019-12-24")
      expect(bookings.totalPrice).to eq(20)
    }
  end
end