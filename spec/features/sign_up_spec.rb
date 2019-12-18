feature "signing up" do

  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: "test@mail.com")
    fill_in('password', with: 'password')
    fill_in('name', with: 'name3')
    click_button("Submit")
    expect(current_path).to eq '/sign_up'
end
end
