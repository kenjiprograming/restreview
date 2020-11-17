class LikesController < ApplicationController

  def create
    like = current_user.likes.create(posted_id: params[:id])
    # binding.pry
    redirect_to "/posteds/#{params[:id]}"
  end
  
  def destroy
    like = Like.find_by(posted_id: params[:id], user_id: current_user.id)
    like.destroy
    redirect_to "/posteds/#{params[:id]}"
  end
  
end
