class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @article_comments = ArticleComment.where(article_id: @article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
    flash.now[:notice] = "投稿を削除しました"
  end
end
