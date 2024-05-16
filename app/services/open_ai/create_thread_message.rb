module OpenAi
  class CreateThreadMessage < Base
    def initialize(thread_id:, prompt:)
      super
      @path = "/threads/#{thread_id}/messages"
      @prompt = prompt
    end

    def call
      @headers['OpenAI-Beta'] = 'assistants=v2'

      options = {
        body: {
          role: 'user',
          content: @prompt,
        }.to_json,
        headers: @headers
      }

      self.class.post(@path, options)
    end
  end
end
