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

      response = self.class.post(@path, options)

      puts '#########################'
      puts 'Create Thread Message'
      puts '#########################'
      puts response

      response
    end
  end
end
