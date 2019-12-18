feature 'signing in' do

  scenario 'a user can sign in' do
      visit '/sessions/new'
      fill_in('email', with: "test@mail.com")
      fill_in('password', with: 'pass123')
      click_button("Submit")
      expect(current_path).to eq '/spaces'
  end
end



