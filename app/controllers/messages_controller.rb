class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    chat = current_user.chats.find(params[:chat_id])

    @message = chat.messages.create!(body: message_params[:body], origin: :user)
    @response = chat.messages.create!(body: '', origin: :ai)

    AiResponseJob.perform_later(prompt: message_params[:body], message: @response)

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy
    
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
