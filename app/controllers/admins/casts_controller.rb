class Admins::CastsController < ApplicationController
  before_action :access_admin

  def new
  	@movie = Movie.find(params[:movie_id])
  	@cast = Cast.new
  	@people = Person.all
  	@person = Person.new
  	@casts = Cast.where(movie_id: @movie.id)
  end

  def create
  	@movie = Movie.find(params[:movie_id])
  	params[:movie][:casts_attributes].each do |num|
  		if params[:movie][:casts_attributes]["#{num}"][:id]
  			cast = Cast.find(params[:movie][:casts_attributes]["#{num}"][:id])
  			unless params[:movie][:casts_attributes]["#{num}"][:p_name] == cast.p_name
  				if person = Person.find_by(person_name: params[:movie][:casts_attributes]["#{num}"][:p_name])
  					cast.person_id = person.id
	  				cast.p_name = params[:movie][:casts_attributes]["#{num}"][:p_name]
	  			else
	  				person = Person.create(person_name: params[:movie][:casts_attributes]["#{num}"][:p_name])
	  				cast.person_id = person.id
	  				cast.p_name = params[:movie][:casts_attributes]["#{num}"][:p_name]
	  			end
  			end
  			if params[:movie][:casts_attributes]["#{num}"][:actor] == '0'
  				cast.actor = false
  			else
  				cast.actor = true
  			end
  			if params[:movie][:casts_attributes]["#{num}"][:director] == '1'
  				cast.director = true
  			else
  				cast.director = false
  			end
  			if params[:movie][:casts_attributes]["#{num}"][:scenario] == '1'
  				cast.scenario = true
  			else
  				cast.scenario = false
  			end
  			cast.save
  		else
	  		cast = Cast.new(movie_id: @movie.id)
	  		if person = Person.find_by(person_name: params[:movie][:casts_attributes]["#{num}"][:p_name])
	  			cast.person_id = person.id
	  			cast.p_name = params[:movie][:casts_attributes]["#{num}"][:p_name]
	  			if params[:movie][:casts_attributes]["#{num}"][:actor] == '0'
	  				cast.actor = false
	  			end
	  			if params[:movie][:casts_attributes]["#{num}"][:director] == '1'
	  				cast.director = true
	  			end
	  			if params[:movie][:casts_attributes]["#{num}"][:scenario] == '1'
	  				cast.scenario = true
	  			end
	  			unless Cast.find_by(movie_id: @movie.id, person_id: person.id)
	  				cast.save
	  			end
	  		else
	  			person = Person.create(person_name: params[:movie][:casts_attributes]["#{num}"][:p_name])
	  			cast.person_id = person.id
	  			cast.p_name = params[:movie][:casts_attributes]["#{num}"][:p_name]
	  			if params[:movie][:casts_attributes]["#{num}"][:actor] == '0'
	  				cast.actor = false
	  			end
	  			if params[:movie][:casts_attributes]["#{num}"][:director] == '1'
	  				cast.director = true
	  			end
	  			if params[:movie][:casts_attributes]["#{num}"][:scenario] == '1'
	  				cast.scenario = true
	  			end
	  			cast.save
	  		end
	  	end
  	end
  	redirect_to new_admins_movie_cast_path(movie_id: @movie.id)
  end

  def destroy
  	movie = Movie.find(params[:movie_id])
  	cast = Cast.find(params[:id])
  	cast.destroy
  	redirect_to new_admins_movie_cast_path(movie_id: movie.id)
  end

  private
  	def post_params
        params.require(:movie).permit(
							          :j_title,
							          :e_title,
							          :release,
							          :time,
							          :summary,
							          :movie_image,
							          :trailer_id,
							          :score_average,
							          :genre_id,
							          :country_id,
							          :company_id,
							          casts_attributes: [:id, :post_id, :person_id, :p_name , :actor, :director, :scenario]
							        )
	end
end
