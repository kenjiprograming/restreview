class FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:id]).followings
  end
end
