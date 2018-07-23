class TopController < ApplicationController
	def top
		@lists = List.where(top: true)
	end

	def search

	end
end
