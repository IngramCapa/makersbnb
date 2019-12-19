feature "viewing properties" do
  
    scenario "a logged in user can see all properties" do
  
      # Add the test data

       #user signs in before 

        Property.create(prop_name: "makers house", prop_description: "old building in aldgate east", 
                price_per_night: "20", startdate: "2019-12-17", enddate: "2019-12-31")
        Property.create(prop_name: "edward house", prop_description: "dogs trust in angel", 
                price_per_night: "30", startdate: "2019-10-11", enddate: "2020-12-31")
        Property.create(prop_name: "parliament", prop_description: "nice river view", 
                price_per_night: "100", startdate: "1870-10-11", enddate: "2150-12-31")
  
      visit '/spaces'
  
      expect(page).to have_content("makers house")
    end
  end
  