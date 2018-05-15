class Doctor < ActiveRecord::Base
	has_many :specialties
	has_many :comments
	has_many :doctor_specialties
	has_many :specialties, through: :doctor_specialties

	validates :name, presence: true
	validates :address, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true

	def self.rankings_by(specialty)
		specialty.doctors.joins(:comments).select("doctors.*, avg(comments.rating) as average_rating, count(comments.id) as number_of_reviews").group("doctors.id").order("average_rating DESC, number_of_reviews DESC")
	end

end