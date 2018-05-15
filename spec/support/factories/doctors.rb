FactoryBot.define do
	factory :doctor do |f|
		name { Faker::Name.name }
		address { Faker::Address.street_address }
		latitude { Faker::Address.latitude.to_f }
		longitude { Faker::Address.longitude.to_f }
		specialties { [association(:specialty)] }


	end
end
