class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
    flash.now[:notice] = "投稿を削除しました"
  end
end
