require 'user'

describe User do
  
  describe ".sign_up" do
    it "creates a new user" do
      user = User.sign_up(name: "name3", email: "name3@mail.com", password: "test")
      expect(user).to be_a User
      expect(user.name).to eq "name3"
      expect(user.email).to eq "name3@mail.com"
    end
  end


  describe '.sign_in' do

    it 'returns a user given a correct username and password, if one exists' do
      user = User.sign_up(name: 'shaf', email: 'test@example.com', password: 'password123')
      authenticated_user = User.sign_in(email: 'test@example.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end
  end

end