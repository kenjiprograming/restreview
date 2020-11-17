class PostedsController < ApplicationController

  def show
    @posted = Posted.find(params[:id])
    @likes = Like.where(posted_id: params[:id])
  end

  def destroy
    post = Posted.find(params[:id])
    post.destroy
    redirect_to root_path
  end

end
