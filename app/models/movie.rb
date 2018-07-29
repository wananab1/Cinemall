class Movie < ApplicationRecord
	belongs_to :genre
	belongs_to :country
	belongs_to :company
	attachment :movie_image
	has_many :casts, :dependent => :destroy
	has_many :reviews, :dependent => :destroy
	has_many :clips, dependent: :destroy
	has_many :list_items, dependent: :destroy
	accepts_nested_attributes_for :casts, allow_destroy: true

	validates :j_title, presence: true
	validates :release, presence: true
	validates :time, presence: true
	validates :summary, presence: true
	validates :genre_id, presence: true
	validates :country_id, presence: true
	validates :company_id, presence: true
	validates :movie_image, presence: true


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
