class ClipsController < ApplicationController
  def index
  	@user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
  	@movie = Movie.find(params[:movie_id])
  		unless @movie.clipped_by?(current_user)
  			@movie.clipping(current_user)

        respond_to do |format|
          format.js
        end
  		end
  end

  def destroy
  	@movie = Movie.find(params[:movie_id])
		if @movie.clipped_by?(current_user)
			@movie.unclipping(current_user)

      respond_to do |format|
        format.js
      end
		end
  end

  def us_create
    @movie = Movie.find(params[:movie_id])
    unless @movie.clipped_by?(current_user)
      @movie.clipping(current_user)

      respond_to do |format|
        format.js
      end
    end
  end

  def us_destroy
    @movie = Movie.find(params[:movie_id])
    if @movie.clipped_by?(current_user)
      @movie.unclipping(current_user)

      respond_to do |format|
        format.js
      end
    end
  end

end
