class PostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  # Empty method because here is called before_action
  def show
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = Current.user
    
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

    # Empty method because here is called before_action
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    # Function finding post with selected ID. This method is called in all method listed in 'before action' in order to reduce writing the same code many times
    def set_post
      @post = Post.find(params[:id])
    end

    # Function for checking if post we are trying to created meets our requirements before making query to database
    def post_params
      params.expect(post: [:title, :content, :image])
    end
end