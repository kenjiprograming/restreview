class GonesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gones = current_user.gones.all.order(created_at: "DESC")
  end

  def show
    @gone = current_user.gones.find(params[:id])
    @posted = Posted.new
  end

  def create
    want = current_user.wants.find(params[:want_id])
    @gone = current_user.gones.create(name: want.name,
      address: want.address,
      url: want.url,
      comment: want.caption,
      opentime: want.opentime,
      holiday: want.holiday,
      budget: want.budget
    )
    redirect_to gones_path
  end

  def update
    @gone = current_user.gones.find(params[:id])
    if params[:gone][:image_id]
      image_id = params[:gone][:image_id]
      image = @gone.images.find(image_id)
      image.purge
    end
    if params.require(:gone).permit(:comment, images: [])
      @gone.update params.require(:gone).permit(:comment, images: [])
      redirect_to @gone
    else
      render :show
    end
  end

  def destroy
    current_user.gones.find(params[:id]).destroy
    redirect_to gones_path
  end
end
