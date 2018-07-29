class Country < ApplicationRecord
	has_many :movies
	validates :country_name, presence: true

end
