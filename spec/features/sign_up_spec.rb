feature "signing up" do

  scenario "a new user signs up" do
    visit '/views/index.erb'
    expect(current_path).to eq '/users/index'
    fill_in('email', with: "test@mail.com")
    fill_in('password', with: 'password')
    click_button("Submit")
    expect(current_path).to eq '/space/new'
  end
end
