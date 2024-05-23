class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    # if params[:prompt]
    #   chat = OpenAi::Base.new
    #   @response = chat.complete(params[:prompt])
    # else
    #   @response = 'response is empty'
    # end

    @chats = current_user.chats.order(created_at: :desc)
  end

  def show
    @chat = current_user.chats.find(params[:id])
  end

  def create
    @chat = current_user.chats.new

    thread_id = OpenAi::CreateThread.new.call

    assistant = Assistant.find_by(name: params[:assistant])

    @chat.name = "Chat - #{params[:assistant]} - #{l(Date.current.in_time_zone('Brasilia'))}"
    @chat.assistant = assistant
    @chat.thread_id = thread_id

    @chat.save!

    redirect_to @chat
  end
end
