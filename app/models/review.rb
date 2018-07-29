class Review < ApplicationRecord
	belongs_to :movie
	belongs_to :user
    has_many :likes, dependent: :destroy
    validates :movie_id, presence: true
	validates :user_id, presence: true

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
    end

    def iine(user)
		likes.create(user_id: user.id)
	end

	def uniine(user)
		likes.find_by(user_id: user.id).destroy
	end




end
