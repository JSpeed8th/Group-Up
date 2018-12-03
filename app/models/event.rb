class Event < ApplicationRecord
	has_many :invites
	has_many :users, through: :invites
	has_many :locations, through: :invites
	has_many :recommendations
	has_many :locations, through: :recommendations
end
