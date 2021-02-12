class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @followings = User.find(params[:user_id]).followings
    @followers = User.find(params[:user_id]).followers
  end
end
