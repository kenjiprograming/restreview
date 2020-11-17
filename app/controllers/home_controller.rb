class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Posted.all
  end
end
