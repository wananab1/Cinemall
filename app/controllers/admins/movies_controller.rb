class Admins::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
    @genre = Genre.new
    @companies = Company.all
    @company = Company.new
    @countries = Country.all
    @country = Country.new

  end

  def create
    movie = Movie.new(movie_params)

    if genre = Genre.find_by(genre_name: params[:genre][:genre_name])
      movie.genre_id = genre.id
    else
      genre_new = Genre.create(genre_name: params[:genre][:genre_name])
      movie.genre_id = genre_new.id
    end

    if company = Company.find_by(company_name: params[:company][:company_name])
      movie.company_id = company.id
    else
      company_new = Company.create(company_name: params[:company][:company_name])
      movie.company_id = company_new.id
    end

    if country = Country.find_by(country_name: params[:country][:country_name])
      movie.country_id = country.id
    else
      country_new = Country.create(country_name: params[:country][:country_name])
      movie.country_id = country_new.id
    end

    movie.save
    redirect_to admins_movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
    @genres = Genre.all
    @genre = Genre.new
    @companies = Company.all
    @company = Company.new
    @countries = Country.all
    @country = Country.new
  end

  def update
    movie = Movie.find(params[:id])
    if genre = Genre.find_by(genre_name: params[:genre][:genre_name])
      movie.genre_id = genre.id
    else
      genre_new = Genre.create(genre_name: params[:genre][:genre_name])
      movie.genre_id = genre_new.id
    end

    if company = Company.find_by(company_name: params[:company][:company_name])
      movie.company_id = company.id
    else
      company_new = Company.create(company_name: params[:company][:company_name])
      movie.company_id = company_new.id
    end

    if country = Country.find_by(country_name: params[:country][:country_name])
      movie.country_id = country.id
    else
      country_new = Country.create(country_name: params[:country][:country_name])
      movie.country_id = country_new.id
    end
    movie.update(movie_params)
    redirect_to admins_movies_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admins_movies_path
  end

  private
    def movie_params
        params.require(:movie).permit(:j_title, :e_title, :release, :time, :summary, :movie_image, :trailer_id, :score_average, :genre_id, :country_id, :company_id)
    end
end
