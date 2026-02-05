class UsersController < ApplicationController
before_action :set_user, only: %i[ show ]

  def index
  end

  def show
    @posts = @user.posts
    @followers = @user.follower_users
    @following = @user.followed_users
  
    if authenticated?
      @relationship = Current.user.active_relationships.find_by(followed_id: @user.id)
    end
  end

  private
  # Finding user with selected ID
  def set_user
    @user = User.find(params[:id])
  end
end
