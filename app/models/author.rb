class Author < ActiveRecord::Base
	has_many :comments

	validates :name, presence: true
	validates :email, presence: true

	def doctors
		Comment.where(author: self).map(&:doctor)
	end

	def specialists
		doctors.map(&:specialties).flatten.uniq
	end

end