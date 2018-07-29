class Company < ApplicationRecord
	has_many :movies
	validates :company_name, presence: true
end
