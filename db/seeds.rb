# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'soda/client'
require 'rest-client'


User.destroy_all
Location.destroy_all
Rating.destroy_all

10.times do 
    User.create(name: Faker::TvShows::Seinfeld.character, password_digest: Faker::Code.nric, bio: Faker::TvShows::Seinfeld.quote)
end

# 10.times do 
#     Location.create(name: Faker::Company.name , location_category: "subway station" , ada: false, ada_type: Faker::Construction.subcontract_category)
# end

10.times do 
    Rating.create(user_id: rand(1..10), location_id: rand(1..10), rating: rand(1..5) , review: Faker::Company.bs)
end




location_data = RestClient.get('https://cody-castro.github.io/Data/Subway%20Entrances%20(3).geojson')
api_body = location_data.body
location_info = JSON.parse(api_body)
# binding.pry

data_you_want = location_info["features"]

    data_you_want.each do |obj|

        Location.create(
            name: obj["properties"]["name"],
            location_category: "Subway Station",
            ada: true,
            ada_type: "",
            long: obj["geometry"]["coordinates"][0],
            lat: obj["geometry"]["coordinates"][1]
        )
end

puts "muaahahahah they're alive!"