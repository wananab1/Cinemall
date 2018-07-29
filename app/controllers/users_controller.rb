class UsersController < ApplicationController
  before_action :access_authority, only: [:edit]

  def show
  	@user = User.find(params[:id])
    @review = Review.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	  if @user.update(user_params)
        flash[:info] = "プロフィールを編集しました"
  	    redirect_to user_path(@user)
      else
        render 'edit'
      end
  end

  def follow
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
  end




  def access_authority
    unless   admin_signed_in? ||  user_signed_in? && current_user.id == params[:id].to_i
      flash[:danger] = '権限がありません'
      if user_signed_in?
        redirect_to user_path(current_user)
      else
        redirect_to user_session_path
      end
    end
  end

  private
    def user_params
        params.require(:user).permit(:user_name, :email, :user_intro, :profile_image )
    end
end
