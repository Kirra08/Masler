class Public::RelationshipsController < ApplicationController

  def follow
    @profile = User.find(params[:user_id])
    @user = User.find(params[:id])
    @profile.follow(params[:id])
  end

  def unfollow
    @profile = User.find(params[:user_id])
    @user = User.find(params[:id])
    @profile.unfollow(params[:id])
  end

  def library
    @articles = Article.where(user_id: [*current_user.following_ids])
    @body_part_genres = BodyPartGenre.all
    @gear_genres = GearGenre.all
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
