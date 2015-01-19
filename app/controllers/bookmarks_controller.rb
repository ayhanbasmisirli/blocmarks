class BookmarksController < ApplicationController
	def index
		@bookmarks = Bookmark.all
		@likes = Like.new
	end
	def destroy
    	@bookmark = Bookmark.find(params[:id])
    	authorize @bookmark
	    if @bookmark.destroy
	      redirect_to root_path , notice: "Bookmark has been deleted."
	    else
	      redirect_to root_path , notice: "Error, please try again."
	    end
  end
end
