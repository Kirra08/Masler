class Public::ArticleCommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end


  private
  def article_comments_params
    params.require(:article_comments).permit(:title, :comment)
  end
end
