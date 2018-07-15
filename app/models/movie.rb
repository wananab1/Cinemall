class Movie < ApplicationRecord
	belongs_to :genre
	belongs_to :country
	belongs_to :company
	attachment :movie_image
	has_many :casts, :dependent => :destroy
	accepts_nested_attributes_for :casts, allow_destroy: true
end
