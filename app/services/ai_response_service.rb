class AiResponseService < ApplicationService
  def initialize(prompt:, message:)
    @prompt = prompt
    @message = message
  end

  def call
    OpenAi::CreateThreadMessage.new(thread_id: @message.chat.thread_id, prompt: @prompt).call
    OpenAi::RunThread.new(thread_id: @message.chat.thread_id, assistant_id: @message.chat.assistant.external_id).call

    ai_response = OpenAi::ListThreadMessages.new(thread_id: @message.chat.thread_id).call
    @message.update!(body: ai_response)
  end
end