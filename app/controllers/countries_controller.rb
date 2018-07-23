class CountriesController < ApplicationController
  def show
  	@country = Country.find(params[:id])
  	@genres = Genre.all
  	@countries = Country.all
  	@review = Review.new
  end
end
