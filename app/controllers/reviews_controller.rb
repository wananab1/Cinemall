class ReviewsController < ApplicationController
  def create
  	movie = Movie.find(params[:movie_id])
  	review = Review.new(review_params)
  	if params[:score].blank?
  		review.score = 0.0
  	else
  		review.score = params[:score]
  	end
  	review.user_id = current_user.id
  	review.movie_id = movie.id
  	review.save
  	redirect_to movie_path(movie)
  end

  def update
  	review = Review.find(params[:id])
  	movie = Movie.find(params[:movie_id])
  	if params[:score].blank?
  		review.score = 0.0
  	else
  		review.score = params[:score]
  	end
  	review.update(review_params)
  	redirect_to movie_path(movie)
  end

  def destroy
  	review = Review.find(params[:id])
  	movie = Movie.find(params[:movie_id])
  	review.destroy
  	redirect_to movie_path(movie)
  end

   def review_params
        params.require(:review).permit(:comment, :score, :secret, :movie_id, :user_id)
    end
end
