class RelationshipsController < ApplicationController
  before_action :require_authentication

  def create
    @followed_user = User.find(params[:relationship][:followed_id])
    @relationship = Current.user.active_relationships.new(followed_id: @followed_user.id)

    if @relationship.save
      flash[:notice] = "Follow Successful"
    else
      flash[:notice] = "Follow Unuccessful"
    end

    redirect_to user_path(@followed_user)
  end

  def destroy
    @relationship = Current.user.active_relationships.find(params[:id])
    @followed_user = @relationship.followed_user

    @relationship.destroy
    flash[:notice] = "Unfollowed"

    redirect_to user_path(@followed_user)
  end
end