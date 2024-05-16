class AiResponseJob < ApplicationJob
  queue_as :default

  def perform(prompt:, message:)
    AiResponseService.new(prompt: prompt, message: message).call
  end
end