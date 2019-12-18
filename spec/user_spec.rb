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
end
