feature 'authentication' do 
  it 'a use can sign in' do
    visit '/'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Submit')

    expect(page).to have_current_path '/spaces'
  end
end

