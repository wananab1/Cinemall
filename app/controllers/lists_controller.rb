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
  end
end
