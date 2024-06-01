module Admin
  class AssistantsController < AdminController
    def index
      @assistants = Assistant.all
    end

    def show
      @assistant = Assistant.find(params[:id])
      @archives = Archive.all
    end

    def update
      @assistant = Assistant.find(params[:id])
      archive_id = params[:archive_id]
      checked = params[:checked]

      if checked
        @assistant.archives << Archive.find(archive_id) unless @assistant.archives.exists?(archive_id)
      else
        @assistant.archives.delete(archive_id)
      end

      @archives = Archive.all

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @assistant }
      end
    rescue => e
      render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash", locals: { notice: e.message })
    end
  end

end