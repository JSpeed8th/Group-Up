class Location < ApplicationRecord
	has_many :invites
	has_many :users, through: :invites
	has_many :events, through: :invites
	has_many :recommendations
	has_many :events, through: :recommendations
end
