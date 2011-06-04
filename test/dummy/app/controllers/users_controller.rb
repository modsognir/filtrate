class UsersController < ApplicationController
  def index
    @filtered = User.filtered(params[:filters]).all
  end
end