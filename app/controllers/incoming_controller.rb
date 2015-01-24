class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    @topic =  Topic.find_or_create_by(title: params['subject'])
    @user = User.find_by(email: params['sender'])

    @bookmark = Bookmark.new
    @bookmark.url = params['body-plain']
    @bookmark.user = @user
    @bookmark.topic = @topic
    @bookmark.save
    # if @bookmark.save
    # else
    #   send_mail_back_to_sender_telling_them_why_it_failed
    # end
    # You put the message-splitting and business
    # magic here.

    # Assuming all went well.
    head 200
  end
end
