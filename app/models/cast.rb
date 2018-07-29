class Cast < ApplicationRecord
	belongs_to :movie
	belongs_to :person

	validates :p_name, presence: true
	validates :movie_id, presence: true
	validates :person_id, presence: true

end
