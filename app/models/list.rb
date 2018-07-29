class List < ApplicationRecord
	has_many :list_items, dependent: :destroy
	validates :list_name, presence: true
	validates :list_intro, presence: true
end
