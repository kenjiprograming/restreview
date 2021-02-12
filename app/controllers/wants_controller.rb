class WantsController < ApplicationController
  before_action :authenticate_user!
  
  def index
      @q = current_user.wants.ransack(params[:q])
      if @q
        @wants = @q.result(distinct: true).order(created_at: "DESC")
      else
        @wants = current_user.wants.order(created_at: "DESC")
      end
  end

  def show
    @want = current_user.wants.find_by(id: params[:id])
  end

  def create
    rest_id = params.require(:want).permit(:rest_id)["rest_id"]
    par = params.require(:want).permit(:caption, :listname)
    rest = Rest.find(rest_id)
    @want = current_user.wants.new(
      name: rest.name,
      address: rest.address,
      url: rest.url,
      opentime: rest.opentime,
      holiday: rest.holiday,
      tel: rest.tel,
      budget: rest.budget,
      caption: par[:caption],
      listname: par[:listname]
    )
    if Want.where(user_id: @want.user_id, name: @want.name, address: @want.address)
      @want.save
      Rest.all.each { |rest| rest.delete }
      flash[:notice] = '行きたいお店リストに入れました'
      redirect_to want_path(@want)
    else
      flash[:alert] = 'すでに行きたいお店リストに入ってます'
      render :index
    end
  end

  def destroy
    want = current_user.wants.find(params[:id])
    want.destroy
    redirect_to wants_path
  end
end
