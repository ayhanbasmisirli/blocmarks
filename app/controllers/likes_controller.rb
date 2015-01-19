class LikesController < ApplicationController
  def new
	end
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    authorize @like
    if @like.save
      redirect_to bookmarks_path , notice: "like created."
    else
      redirect_to bookmarks_path , notice: "Error, please try again."
    end
  end
  def destroy
    @like = Like.find( params[:id] )
    authorize @like
    if @like.destroy
      redirect_to bookmarks_path , notice: "Like has been deleted."
    else
      redirect_to bookmarks_path , notice: "Error, please try again"
    end
  end

  private

  def like_params
    params.permit(:bookmark_id , :user_id)
  end

end
