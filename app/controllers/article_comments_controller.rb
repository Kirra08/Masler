class ArticleCommentsController < ApplicationController
  def index
  end 
  
  def new
  end 
  
  def create
  end 
  
  def destroy
  end 
  
  
  private
  def article_comments_params
    params.require(:article_comments).permit(:title, :comment)
  end 
end
