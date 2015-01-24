class UsersController < ApplicationController
  def index
  end

  # GET /users/5
  # params = {id: 5}
  def show
  	@user = User.find(params[:id])
  	@bookmarks = @user.bookmarks
  	@likes = @user.likes
  end
end
