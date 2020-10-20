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
# require 'rgeo'


User.destroy_all
puts "old users exterminated"
Location.destroy_all
puts "all locations destoryed"
Rating.destroy_all
puts "all ratings are wiped clean"

10.times do 
    User.create(name: Faker::TvShows::Seinfeld.character, password_digest: Faker::Code.nric, bio: Faker::TvShows::Seinfeld.quote)
end

puts "new users rising from the grave"

10.times do 
    Rating.create(user_id: rand(1..10), location_id: rand(1..1900), rating: rand(1..5) , review: Faker::Company.bs)
end

puts "Ratings are at an all time high"

location_data = RestClient.get('https://cody-castro.github.io/Data/Subway%20Entrances%20(3).geojson')
api_body = location_data.body
location_info = JSON.parse(api_body)
data_you_want = location_info["features"]
# feature = RGeo::GeoJSON.decode(data_you_want)

    data_you_want.each do |obj|

        Location.create(
            name: obj["properties"]["name"],
            location_category: "Subway Station",
            ada: true,
            ada_type: "",
            coordinates: obj["geometry"]["coordinates"],
            line: obj["properties"]["line"]
        )
end

puts "muaahahahah they're alive!"
