class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = Article.all.where(user_id: @user).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to articles_path
  end

  def delete_user
    #会員のis_deletedにtrueを入れて更新
    current_user.update(is_deleted: true)
    #ログイン情報をリセット（ログインされたままに
    reset_session
    redirect_to root_path, notice: "退会しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
