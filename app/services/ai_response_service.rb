class AiResponseService < ApplicationService
  def initialize(prompt:)
    @prompt = prompt
  end

  def call
    # open_ai_service = OpenAi::Base.new
    # open_ai_service.complete(@prompt)
    'hello'
  end
end