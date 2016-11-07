class Hospital < ApplicationRecord
	has_many :managers
	has_many :doctors
	has_many :staffs
end
