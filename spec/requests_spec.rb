require 'requests'

describe Requests do

  let(:requests) { Requests.new("1") }

  it "should return the logged in user's ID" do
    expect(requests.user).to eq "1"
  end

  describe '#date_converter' do

    context "when we want to show a date to a user, we want that date to be on the most readable format" do 
        
        it "should accept a date (YYYY-MM-DD) as an argument, and return that same date as DD/MM/YYYY" do
          expect(requests.date_converter("2020-01-01")).to eq "01/01/2020"
        end
    end
  end
end