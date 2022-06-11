class Public::ArticleCommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @article_comment = ArticleComment.new(article_comments_params)
    @article_comment.save
    redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.destroy
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @article_comment = ArticleComment.find(params[:id])
  end

  def update
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.update(article_comments_params)
    redirect_to article_path(@article)
  end


  private
  def article_comments_params
    params.require(:article_comment).permit(:title, :comment, :article_id, :user_id)
  end
end
