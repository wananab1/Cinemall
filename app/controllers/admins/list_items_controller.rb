class Admins::ListItemsController < ApplicationController
  before_action :access_admin

  def create
  	list = List.find(params[:list_id])
  	list_item = ListItem.new(list_item_params)
  	list_item.list_id = list.id
  		if ListItem.find_by(movie_id: list_item.movie_id, list_id: list.id)
  			redirect_to new_admins_list_list_item_path(list)
  			return
  		end
  	list_item.save
  	redirect_to new_admins_list_list_item_path(list)
  end

  def destroy
  	list = List.find(params[:list_id])
    list_item = ListItem.find(params[:id])
    list_item.destroy
    redirect_to new_admins_list_list_item_path(list)
  end

  def new
  	@list = List.find(params[:list_id])
  	@list_item = ListItem.new
    @m = Movie.search(params[:m], search_key: :m)
  	@movies = @m.result(distinct: true)
  end

private
    def list_item_params
        params.require(:list_item).permit(:movie_id, :list_id)
    end
end
