class UserController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
    @likes = Like.where(user_id: params[:id])
    @gones = Gone.where(user_id: params[:id])
    @wants = Want.where(user_id: params[:id])
  end
end
