feature 'View Requests' do 
  scenario 'a user should be able to see the request columns' do
    visit('/requests')
    expect(page).to have_content "Requests Made"
    expect(page).to have_content "Requests Received"
  end

  scenario 'a user should be able to see their booking requests' do
    visit('/requests')
    expect(page).to have_content 'Booking 1'
    expect(page).to have_content 'Booking 2'
    expect(page).to have_content 'Booking 3'
  end

  scenario 'a user should be able to see if their booking is confirmed' do
    visit('/requests')
    expect(page).to have_content 'Confirmed'
  end

  scenario 'a user should be able to the date the booking was submitted' do
    visit('/requests')
    expect(page).to have_content 'Date Booked:'
  end
end
