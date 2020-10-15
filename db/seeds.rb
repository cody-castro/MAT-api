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



10.times do 
    User.create(name: Faker::TvShows::Seinfeld.character, password_digest: Faker::Code.nric, bio: Faker::TvShows::Seinfeld.quote)
end

10.times do 
    Location.create(name: Faker::Company.name , location_category: "subway station" , ada: false, ada_type: Faker::Construction.subcontract_category)
end

10.times do 
    Rating.create(user_id: rand(1..10), location_id: rand(1..10), rating: rand(1..5) , review: Faker::Company.bs)
end




response = RestClient.get("http://data.cityofnewyork.us/resource/he7q-3hwy.csv?$limit=5000&$$app_token=so26rHtpG3IG2pWUA7J0B9BH1")
binding.pry
result = JSON.parse(response.body)

read_json = File.read(response.body)
hashed_json = JSON.parse(read_json)


puts "muaahahahah they're alive!"