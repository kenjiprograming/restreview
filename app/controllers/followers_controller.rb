class FollowersController < ApplicationController
  def index
    @followers = User.find(params[:id]).followers
  end
end
