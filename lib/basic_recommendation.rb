# Here's what I did: I basically took the comment left for a doctor and found that doctor's specialty.
#  For the doctors with that specialty, I return the top 5 of them back to the user (based on their average rating). I don't weight the ratings based on number of reviews (ie, one rating of 5 would rank higher than 10 ratings of 4.5), but for this simple model it works. 

# We could have built out a more fully-featured recommendation engine:
# 1. Filter recommendations based on location of doctors to current doctor
# 2. Do NLP (maybe using LDA) to discover topics user is discussing and recommend accordingly.
# 4. We could also look at other specialists the author has seen and recommend doctors from other specialists, especially if they just recently saw them. 
# 5. Based on the rating of the current comment, we could adjust recommendations. 

class BasicRecommendation

	def initialize(comment, limit = 5)
		@comment = comment
		@doctor = @comment.doctor
		@limit = limit 
	end

	def recommendations
		(ranked_doctors - [doctor]).first(@limit)
	end

	private

	def doctor
		@doctor
	end

	def comment
		@comment
	end

	def rating
		@comment.rating
	end

	def ranked_doctors
		Doctor.rankings_by(doctor_specialty)
	end

	def doctor_specialty
		doctor.specialties.first
	end

end