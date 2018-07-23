class GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@genres = Genre.all
  	@countries = Country.all
  	@review = Review.new
  end
end
