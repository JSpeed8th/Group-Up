class Recommendation < ApplicationRecord
	has_many :votes
	has_many :invites, through: :votes
	belongs_to :event
	belongs_to :location
end
