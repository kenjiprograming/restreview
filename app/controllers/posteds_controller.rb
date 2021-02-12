class PostedsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posteds = Posted.where(user_id: current_user).or(
        Posted.where(user_id: current_user.followings.each do |following|
            following.id
          end 
        )
      ).order(created_at: "DESC")
  end

  def show
    @posted = Posted.find(params[:id])
    @likes = Like.where(posted_id: params[:id])
  end

  def create
    gone_id = params.require(:posted).permit(:gone_id)["gone_id"]
    gone_caption = params.require(:posted).permit(:caption)["caption"]
    post = Gone.find(gone_id)
    @posted = current_user.posteds.create(
      name: post.name,
      address: post.address,
      url: post.url,
      opentime: post.opentime,
      holiday: post.holiday,
      tel: post.tel,
      budget: post.budget,
      caption: gone_caption,
    )
    @posted.update params.require(:posted).permit(images: [])
    redirect_to posteds_path
  end

  def destroy
    post = Posted.find(params[:id])
    post.destroy
    redirect_to posteds_path
  end

end
