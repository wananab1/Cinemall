class PeopleController < ApplicationController
  def show
  	@person = Person.find(params[:id])
  	@genres = Genre.all
  	@countries = Country.all
  	@review = Review.new
  end
end
