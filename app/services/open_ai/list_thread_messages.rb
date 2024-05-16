module OpenAi
  class ListThreadMessages < Base
    def initialize(thread_id:, limit: 1)
      super
      @path = "/threads/#{thread_id}/messages"
      @limit = limit
    end

    def call
      @headers['OpenAI-Beta'] = 'assistants=v2'

      options = {
        headers: @headers
      }

      response = self.class.get(@path, options)

      response['data'][0]['content'][0]['text']['value']
    end
  end
end