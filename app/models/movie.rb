class Movie < ApplicationRecord
	belongs_to :genre
	belongs_to :country
	belongs_to :company
	attachment :movie_image
	has_many :casts, :dependent => :destroy
	has_many :reviews, :dependent => :destroy
	has_many :clips, dependent: :destroy

	accepts_nested_attributes_for :casts, allow_destroy: true


	def clipped_by?(user)
		clips.where(user_id: user.id).exists?
    end

    def clipping(user)
		clips.create(user_id: user.id)
	end

	def unclipping(user)
		clips.find_by(user_id: user.id).destroy
	end
end
