class AiResponseJob < ApplicationJob
  queue_as :default

  def perform(prompt:)
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@'
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@'
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@'
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@'
    response = AiResponseService.new(prompt: prompt).call
  end
end