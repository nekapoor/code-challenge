# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Specialty.create!({name: "Cardiology"})
Specialty.create!({name: "Neurology"})
Specialty.create!({name: "Oncology"})
Specialty.create!({name: "Orthopedic"})

5.times do 
	Author.create!({name: Faker::Name.name, email: Faker::Internet.email})
end

20.times do
	d = Doctor.create!({
		name: Faker::Name.name,
		address: Faker::Address.street_address,
		latitude: Faker::Address.latitude.to_f,
		longitude: Faker::Address.longitude.to_f
		})

	DoctorSpecialty.create!({doctor: d, specialty: Specialty.all.sample})
end

100.times do 
	Comment.create!({
		doctor: Doctor.all.sample,
		author: Author.all.sample,
		comment_body: Faker::HarryPotter.quote,
		rating: [*0..5].sample,
		active: true
		})
end


