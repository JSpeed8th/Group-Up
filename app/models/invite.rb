class Invite < ApplicationRecord
	belongs_to :event
	belongs_to :user
	belongs_to :location
	has_many :votes
	has_many :recommendations, through: :votes
end
