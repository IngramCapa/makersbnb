feature "list a space" do

    scenario "a logged in user can fill in the form" do 
        Property.create(prop_name: "beach house", prop_description: "amazing ocean view", 
        price_per_night: "50", startdate: "2020-01-17", enddate: "2020-03-27")
     
        visit '/spaces'
  
        expect(page).to have_content("beach house")
    end
end