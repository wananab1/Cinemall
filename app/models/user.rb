class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :reviews, :dependent => :destroy
   has_many :clips, dependent: :destroy
   has_many :likes, dependent: :destroy
   attachment :profile_image

end
