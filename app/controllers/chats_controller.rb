class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    # if params[:prompt]
    #   chat = OpenAi::Base.new
    #   @response = chat.complete(params[:prompt])
    # else
    #   @response = 'response is empty'
    # end

    @chats = current_user.chats
  end

  def show
    @chat = current_user.chats.find(params[:id])
  end
end
