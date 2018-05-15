class DoctorRecommendation

	def initialize(comment, limit = 5, source=BasicRecommendation)
		@source = source.new(comment, limit)
	end

	def recommendations
		@source.recommendations
	end


end