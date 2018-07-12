class Movie < ApplicationRecord
	belongs_to :genre
	belongs_to :country
	belongs_to :company

	attachment :movie_image
end
