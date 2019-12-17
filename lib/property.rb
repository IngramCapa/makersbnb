require 'pg'
require './spec/database_helpers'

class Property

    attr_reader :id, :prop_name, :prop_description, :price_per_night, :startdate, :enddate
    
    def initialize(id:, prop_name:, prop_description:, price_per_night:, startdate:, enddate:)
        @id = id
        @prop_name = prop_name
        @prop_description = prop_description
        @price_per_night = price_per_night
        @startdate = startdate
        @enddate = enddate
    end

    def self.all

        connection = db_connection

        result = connection.exec("SELECT * FROM properties;")
        result.map { |
            property| Property.new(id: property['id'], prop_name: property['prop_name'], 
            prop_description: property['prop_description'], price_per_night: property['price_per_night'],
            startdate: property['startdate'], enddate: property['enddate'])
        }
    end

    def self.create(prop_name:, prop_description:, price_per_night:, startdate:, enddate:)

        connection = db_connection

        connection.prepare('statement1', 'INSERT INTO properties (prop_name, prop_description, price_per_night, startdate, enddate) 
                            VALUES($1, $2, $3, $4, $5)
                            RETURNING id, prop_name, prop_description, price_per_night, startdate, enddate') 

        result = connection.exec_prepared('statement1', [prop_name, prop_description, price_per_night, startdate, enddate])

        Property.new(
            id: result[0]['id'],
            prop_name: result[0]['prop_name'], 
            prop_description: result[0]["prop_description"], 
            price_per_night: result[0]["price_per_night"], 
            startdate: result[0]["startdate"],
            enddate: result[0]["enddate"]
        )
    end
end