# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Patient.destroy_all
require 'faker'


race = ['American Indian or Alaska Native', 'Asian', 'Black or African American', 'Hispanic or Latino', 'Native Hawaiian or Other Pacific Islander', 'White']
language = ['English', 'Spanish', 'Chinese', 'Vietnamese', 'Hindi', 'Korean', 'Japanese', 'Russian']
ethnicity = ["Hispanic or Latino", "Not Hispanic or Latino"]

20.times do 
    Patient.create(name: Faker::Name.name, address: Faker::Address.full_address, date_of_birth: Faker::Date.birthday, email: Faker::Internet.email, ethnicity: ethnicity.sample, language: language.sample, phone_number: Faker::PhoneNumber.phone_number, race: race.sample)
end



