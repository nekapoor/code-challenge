FactoryBot.define do
	factory :author do |f|
	  name { Faker::Name.name }
	  email { Faker::Internet.email }
	end
end
