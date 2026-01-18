class PostsController < ApplicationController
  before_action :set_post, only: %i [ show edit update destroy ]
  def index
    @posts = Post.all
  end

  def show
  end

  private
  # Function finding post with selected ID. This method is called in all method listed in 'before action' in order to reduce writing the same code many times
  def set_post
    @post = Post.find(params[:id])
  end

  # Function for checking if post we are trying to created meets our requirements before making query to database
  def post_params
    params.expect(post: [ :title, :content, :user_id ] )
  end
end
