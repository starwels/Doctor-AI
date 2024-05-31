class ArchivesController < ApplicationController
  def index
    @chat = Chat.find(params[:chat_id])
    @archives = @chat.assistant.archives
  end
end