class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:alert] = "test"
  end
end