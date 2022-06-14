class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = Article.all.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end