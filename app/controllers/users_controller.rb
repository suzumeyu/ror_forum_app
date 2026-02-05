class UsersController < ApplicationController
before_action :set_user, only: %i[ show ]

  def index
  end

  def show
    @posts = @user.posts
  end

  private
  # Finding user with selected ID
  def set_user
    @user = User.find(params[:id])
  end
end
