class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    # if params[:chat_id]
    #   chat = current_user.chats.find(params[:chat_id])
    # else
    #   chat = current_user.chats.create!(name: message_params[:body][0..10])
    # end
    #
    # open_ai_service = OpenAi::Base.new
    # @response = open_ai_service.complete(message_params[:body])
    #
    # # AiResponseJob.perform_later(prompt: message_params[:body])
    #
    # @message = chat.messages.create!(body: message_params[:body], origin: :user)
    # @response = chat.messages.create!(body: @response, origin: :ai)
    #
    # respond_to do |format|
    #   format.turbo_stream
    # end

    chat = current_user.chats.find(params[:chat_id])
    OpenAi::CreateThreadMessage.new(thread_id: chat.thread_id, prompt: message_params[:body]).call
    OpenAi::RunThread.new(thread_id: chat.thread_id, assistant_id: chat.assistant.external_id).call

    ai_response = OpenAi::ListThreadMessages.new(thread_id: chat.thread_id).call

    @message = chat.messages.create!(body: message_params[:body], origin: :user)
    @response = chat.messages.create!(body: ai_response, origin: :ai)

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
