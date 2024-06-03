class ClinicalCasesController < ApplicationController
  def index
  end

  def new
    @chat = Chat.find(params[:chat_id])
    @clinical_case = ClinicalCase.new
  end

  def create
    @chat = Chat.find(params[:chat_id])

    ActiveRecord::Base.transaction do
      @clinical_case = @chat.clinical_cases.new
      @clinical_case.patient_data = clinical_case_params
      @clinical_case.save!

      body = <<-HTML
Me ajude na avaliação do seguinte caso clínico:
<div class="d-grid gap-2">
<a href="#{url_for([@chat, @clinical_case])}" data-turbo="false" class="btn btn-primary">Link para o Caso</a>
</div>
      HTML

      @chat.messages.create!(body: body, origin: :user)
      @response = @chat.messages.create!(body: '', origin: :ai)
    end

    prompt = 'Me ajude na avaliação do seguinte caso clínico: ' + clinical_case_params.to_json

    AiResponseJob.perform_later(prompt: prompt, message: @response)

    redirect_to @chat
  end

  def show
    @chat = Chat.find(params[:chat_id])
    @clinical_case = ClinicalCase.find(params[:id])
  end

  private

  def clinical_case_params
    params.require(:clinical_case).permit!
  end
end
