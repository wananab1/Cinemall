class Admins::ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to new_admins_list_list_item_path(list)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to admins_lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to admins_lists_path
  end


  private
    def list_params
        params.require(:list).permit(:list_intro, :list_name, :top)
    end
end
