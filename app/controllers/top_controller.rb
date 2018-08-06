class TopController < ApplicationController
  	before_action :user_not_access, only: [:top]

	def top
		@lists = List.where(top: true)
		@movies = Movie.all.order(score_average: :desc).limit(5)
	end

	def search
		@movies = @q.result(distinct: true)
		# binding.pry
		@people = @p.result(distinct: true)
		@genres = Genre.all
  		@countries = Country.all
  		@review = Review.new
  		@lists = List.all

	end

	def about
		
	end

	def user_not_access
		if user_signed_in?
			redirect_to user_path(current_user)
		end
	end
end
