class ListsController < ApplicationController
  def show
  	@list = List.find(params[:id])
  	@genres = Genre.all
  	@countries = Country.all
  	@review = Review.new
  end

  def index
  	@lists = List.all
  	@genres = Genre.all
  	@countries = Country.all
    @movies = Movie.all.order(score_average: :desc).limit(5)
  end

  def score
    @genres = Genre.all
    @countries = Country.all
    @movies = Movie.all.order(score_average: :desc).limit(10)
  end
end
