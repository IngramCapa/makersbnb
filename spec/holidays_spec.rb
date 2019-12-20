require './lib/holidays.rb'

describe(Holidays) do
  let(:holiday) { Holidays.new(Date.new(2019, 12, 23), Date.new(2019, 12, 30), 1)}

    it 'should calculate the number of nights spent' do
      expect(holiday.calculateNight).to eq(7)
    end

    it 'should calculate total price for a property' do
      holiday.calculateNight
      expect(holiday.totalPrice).to eq(7)
    end

    it 'should show the number of days until the start date' do
      expect(holiday.dayUntil).to eq(6)
    end
end
