class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @articles = Article.all.where(user_id: @user).order(created_at: :desc).page(params[:page]).per(6)
  end

  def index
    @users = User.all.where(is_deleted: false)
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
      flash[:notice] = "ほかのユーザーのプロフィール編集はできません"
    end
    if @user.name == "guestuser"
      redirect_to user_path(current_user)
      flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません'
    end
  end

  def update
    current_user.update(user_params)
    redirect_to articles_path
  end

  def withdraw
    #会員のis_deletedにtrueを入れて更新
    current_user.update(is_deleted: true)
    #ログイン情報をリセット（ログインされたままに
    reset_session
    redirect_to root_path, notice: "退会しました"
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user)
      flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_deleted)
  end
end
