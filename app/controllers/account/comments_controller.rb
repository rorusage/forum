class Account::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = current_user.comments.all.order("created_at DESC")
  end
end
