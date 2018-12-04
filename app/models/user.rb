class User < ApplicationRecord
	#custom associations  \
	validates :username, uniqueness: true
	has_many :invites
	has_many :events, through: :invites
	has_many :locations, through: :invites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
