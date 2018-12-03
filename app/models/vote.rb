class Vote < ApplicationRecord
	belongs_to :invite
	belongs_to :recommendation
end
