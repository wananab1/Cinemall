class MoviesController < ApplicationController

  def show
  	@movie = Movie.find(params[:id])
  	@director = Cast.find_by(director: true, movie_id: @movie.id)
  	@scenario = Cast.find_by(scenario: true, movie_id: @movie.id)
  	@actor = Cast.find_by(actor: true, movie_id: @movie.id)

  	@directors = Cast.where(director: true, movie_id: @movie.id).where.not(id: @director.id)
  	@scenarios = Cast.where(scenario: true, movie_id: @movie.id).where.not(id: @scenario.id)
  	@actors = Cast.where(actor: true, movie_id: @movie.id).where.not(id: @actor.id)

  	@casts = 3 + @directors.count + @scenarios.count + @actors.count
  end

end
