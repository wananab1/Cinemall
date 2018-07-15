class Person < ApplicationRecord
	has_many :casts, :dependent => :destroy
end
