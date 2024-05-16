module OpenAi
  class CreateThread < Base
    def initialize
      super
      @path = '/threads'
    end

    def call
      @headers['OpenAI-Beta'] = 'assistants=v2'

      options = {
        headers: @headers
      }

      response = self.class.post(@path, options)

      response['id']
    end
  end
end