class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    like = current_user.likes.create(posted_id: params[:posted_id])
    # binding.pry
    redirect_to posted_path(params[:posted_id])
  end
  
  def destroy
    like = Like.find_by(posted_id: params[:posted_id], user_id: params[:id])
    like.destroy
    redirect_to posted_path(params[:posted_id])
  end
  
end
