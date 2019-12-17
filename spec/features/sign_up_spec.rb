feature "signing up" do

  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: "test@mail.com")
    fill_in('password', with: 'password')
    click_button("Submit")
    expect(current_path).to eq '/spaces'
end
end
