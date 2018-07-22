class LikesController < ApplicationController
  	def create
  		@review = Review.find(params[:review_id])
		unless @review.liked_by?(current_user)
			@review.iine(current_user)

			respond_to do |format|
	          format.js
	        end
  		end
    end

	def destroy
  		@review = Review.find(params[:review_id])
		if @review.liked_by?(current_user)
			@review.uniine(current_user)

  			respond_to do |format|
	          format.js
	        end
		end
    end
end
