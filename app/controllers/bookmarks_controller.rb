class BookmarksController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@bookmarks = Bookmark.all
		@topics = Topic.all
	end
	def show
		@bookmark = Bookmark.find(params[:id])
		authorize @bookmark
	end
	def new
		@bookmark = Bookmark.new
	end
	def update
	    @bookmark = Bookmark.find(params[:id])
	    if @bookmark.update_attributes(bookmark_params)
	      redirect_to bookmarks_path, notice: "Bookmark is saved."
	    else
	      flash[:error] = "Error, please try again."
	      render :new
	    end
  	end
  	def create
  		@topic = Topic.find_or_create_by(title: params[:bookmark][:topic])
	    @bookmark = Bookmark.new(bookmark_params)
	    @bookmark.topic = @topic
	    if @bookmark.save
	      redirect_to bookmarks_path 
	      flash[:notice] = "Bookmark created!"
	    else
	      flash[:error] = "There was an error saving the bookmark. Please try again."
	      render :new
	    end
  	end
	def destroy
    	@bookmark = Bookmark.find(params[:id])
    	if @bookmark.destroy
	      redirect_to topics_path , flash[:notice] = "Bookmark has been deleted."
	    else
	      redirect_to bookmark_path , flash[:error] = "Error, please try again."
    	end
  	end

	private
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
