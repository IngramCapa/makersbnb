require 'property'

describe Property do

    describe ".all" do
        it "returns all properties" do
            # add test data
            property = Property.create(prop_name: "makers house", prop_description: "old building in aldgate east", 
                        price_per_night: "20", startdate: "2019-12-17", enddate: "2019-12-31")
            Property.create(prop_name: "edward house", prop_description: "dogs trust in angel", 
            price_per_night: "30", startdate: "2019-10-11", enddate: "2020-12-31")
            Property.create(prop_name: "parliament", prop_description: "nice river view", 
            price_per_night: "100", startdate: "1870-10-11", enddate: "150-12-31")

            properties = Property.all


            expect(properties.length).to eq 3
            expect(properties.first).to be_a Property
            expect(properties.first.id).to eq property.id
            expect(properties.first.prop_name).to eq "makers house"
            expect(properties.first.prop_description).to eq "old building in aldgate east"
            expect(properties.first.price_per_night).to eq "20"
            expect(properties.first.startdate).to eq "2019-12-17"
            expect(properties.first.enddate).to eq "2019-12-31"
            # expect(properties.first.owner_id).to eq property.owner_id
        end

    end

    describe ".create" do

        it "creates a new property" do
            property = Property.create(prop_name: "makers house", prop_description: "old building in aldgate east", 
            price_per_night: "20", startdate: "2019-12-17", enddate: "2019-12-31")

            expect(property).to be_a Property
            expect(property.prop_name).to eq "makers house"
            expect(property.prop_description).to eq "old building in aldgate east"
            expect(property.price_per_night).to eq "20"
            expect(property.startdate).to eq "2019-12-17"
            expect(property.enddate).to eq "2019-12-31"
            # expect(property.owner_id).to eq property.owner_id

        end
    end
end