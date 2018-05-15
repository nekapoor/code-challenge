FactoryBot.define do
	factory :comment do
		comment_body { Faker::HarryPotter.quote }
		rating { [*0..5].sample }
		active true 
		author
		doctor
	end
end
