class Public::SearchesController < ApplicationController
  def search
    @articles = Article.looks(params[:search], params[:word])
  end
end
