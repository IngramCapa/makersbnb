feature 'Confirm Booking' do
  scenario 'when a user clicks on a space booking request, they should be able to see the name and description of the property' do
    visit('/requests')
    click_on 'Villa'
    expect(page).to have_content "Request for 'Villa'"
    expect(page).to have_content "Property Description"
  end

  scerario 'when the user clicks on a space booking request, they should be able to see details of the booking' do
    visit('/requests')
    click_on 'Villa'
    expect(page).to have_content "From: #{client_id}"
    expect(page).to have_content "Date: #{date_booked}"
    expect(page).to have_content "No. of Spaces booked: (find all bookings made by client).count"
  end

  scenario 'when a user clicks on a space booking request, they should see a list of all the other requests for the same space' do 
    visit('/requests')
    click_on 'Villa'
    expect(page).to have_content "Another Email"
    Expect(page).to have_content "Confirmed"
    Expect(page).to have_content "Date: "
  end
end