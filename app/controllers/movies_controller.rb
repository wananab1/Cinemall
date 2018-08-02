class MoviesController < ApplicationController

  def show
  	@movie = Movie.find(params[:id])
    # sqliteの場合
    @movies = Movie.where(genre_id: @movie.genre.id).where.not(id: @movie.id).order("RANDOM()").limit(6)
    # MySQLの場合
    # @movies = Movie.where(genre_id: @movie.genre.id).where.not(id: @movie.id).order("RAND()").limit(6)

	  if @director = Cast.find_by(director: true, movie_id: @movie.id)
  		@directors = Cast.where(director: true, movie_id: @movie.id).where.not(id: @director.id)
  	end
  	if @scenario = Cast.find_by(scenario: true, movie_id: @movie.id)
  		@scenarios = Cast.where(scenario: true, movie_id: @movie.id).where.not(id: @scenario.id)
  	end

  	if @actor = Cast.find_by(actor: true, movie_id: @movie.id)
  		@actors_all = Cast.where(actor: true, movie_id: @movie.id).where.not(id: @actor.id)
  		@actors_limit = Cast.where(actor: true, movie_id: @movie.id).where.not(id: @actor.id).limit(3)
  	end
	  @cast_count = Cast.where(movie_id: @movie.id).count

    @review = Review.new
    if user_signed_in?
      if @user_review = Review.find_by(movie_id: @movie, user_id: current_user.id)
        @reviews = Review.where(movie_id: @movie.id).where.not(id: @user_review.id)
      end
    else
      @reviews = Review.where(movie_id: @movie.id)
    end


  end

end
