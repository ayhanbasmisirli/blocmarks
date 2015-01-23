class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
    	@topic = Topic.includes(:bookmarks).find(params[:id])
    end

    private
    def topic_params
    	params.require(:topic).permit(:user_id, :title)
    end
end
end
