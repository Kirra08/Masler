class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id)
  end

  def withdraw
    #会員のis_deletedにtrueを入れて更新
    user = User.find(params[:user_id])
    user.update(is_deleted: true)
    flash[:notice] = "退会させました"
  end
end
