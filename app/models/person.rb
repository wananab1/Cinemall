class Person < ApplicationRecord
	has_many :casts, :dependent => :destroy
	validates :person_name, presence: true

end
