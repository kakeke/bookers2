class UsersController < ApplicationController
before_action :authenticate_user! 
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.book
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
    flash[:alert] = "Authority error"
    redirect_to user_path
	end
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
			flash[:notice] = 'profile update successfully'
       		redirect_to user_path(current_user)
        else
        	redirect_to books_path,alert: t('profile update error') 
        end
  end

  private
  def user_params
  	params.require(:user).permit(:username, :profile_image, :introduction)
  end
end
