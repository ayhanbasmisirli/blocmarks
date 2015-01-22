class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
    	@topic = Topic.find(params[:id])
    	@bookmarks = @topic.bookmarks
    end

    def new
    	@topic = Topic.new
    	@user_id = current_user.id
    end	

    def create
    	@topic = Topic.new(topic_params)
    	if @topic.save
    		flash[:success] = "Topic Saved."
    	else
    		flash[:error] = "Error, please try again"
    		render new
        end

    def update
    end

    def edit
    end

    private
    def topic_params
    	params.require(:topic).permit(:user_id, :title)
    end
end
end
