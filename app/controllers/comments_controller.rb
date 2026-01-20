class CommentsController < ApplicationController
  allow_unauthenticated_access only: %i[ show ]
  before_action :set_comment, only: %i[ show edit update destroy ]

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = Current.user
    
    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @comment.post }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to @comment.post }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to post }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
        params.expect(comment: [:content, :post_id])
    end
end