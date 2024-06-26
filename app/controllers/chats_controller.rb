class ChatsController < ApplicationController
  def index
    @chats = current_user.chats.order(created_at: :desc)
  end

  def show
    @chat = current_user.chats.find(params[:id])
  end

  def create
    @chat = current_user.chats.new

    thread_id = OpenAi::CreateThread.new.call

    assistant = Assistant.find_by(name: params[:assistant])

    @chat.name = "Chat - #{params[:assistant]} - #{Date.current.in_time_zone('Brasilia').strftime('%d/%m/%Y')}"
    @chat.assistant = assistant
    @chat.thread_id = thread_id

    @chat.save!

    redirect_to @chat
  end

  def edit
    @chat = current_user.chats.find(params[:id])
  end
  def update
    @chat = current_user.chats.find(params[:id])

    if @chat.update(chat_params)
      redirect_to chats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat = current_user.chats.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_path }
      format.turbo_stream
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
