class Admin::ArticleCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.destroy
    @article = Article.find(params[:article_id])
    @article_comments = ArticleComment.where(article_id: @article)
    flash.now[:notice] = "コメントを削除しました"
  end
end
