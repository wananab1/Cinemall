class TopController < ApplicationController
	def top
		@lists = List.where(top: true)
	end

	def search
		@movies = @q.result(distinct: true)
		# binding.pry
		@people = @p.result(distinct: true)

	end
	def p_search
		@people = Person.all
	end
end
