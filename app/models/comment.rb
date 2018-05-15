class Comment < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :author

	validates :comment_body, presence: true
	validates :doctor_id, presence: true
	validates :author_id, presence: true
	validates :rating, presence: true
end