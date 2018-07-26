class TopController < ApplicationController
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

	end
	def p_search
		@people = Person.all
	end
end
