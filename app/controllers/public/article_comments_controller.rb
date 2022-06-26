class Public::ArticleCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article_comment = ArticleComment.new(article_comments_params)
    @user = current_user
    @article = Article.find(params[:article_id])
    @article_comments = ArticleComment.where(article_id: @article)
    if @article_comment.save
      flash.now[:notice] = "コメントを投稿しました"
    end
  end

  def destroy
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.destroy
    @article = Article.find(params[:article_id])
    @article_comments = ArticleComment.where(article_id: @article)
    flash.now[:notice] = "コメントを削除しました"
  end

  def edit
    @article = Article.find(params[:article_id])
    @article_comment = ArticleComment.find(params[:id])
    unless @article_comment.user.id == current_user.id
      redirect_to article_path(@article)
    end
  end

  def update
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.update(article_comments_params)
    @article = Article.find(params[:article_id])
    flash[:notice] = "コメントを編集しました"
    redirect_to article_path(@article)
  end


  private
  def article_comments_params
    params.require(:article_comment).permit(:title, :comment, :article_id, :user_id)
  end
end
