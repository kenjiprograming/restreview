class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
    @likes = Like.where(user_id: params[:id])
  end
end
