module OpenAi
  class RunThread < Base
    def initialize(thread_id:, assistant_id:)
      super
      @path = "/threads/#{thread_id}/runs"
      @assistant_id = assistant_id
    end

    def call
      @headers['OpenAI-Beta'] = 'assistants=v2'

      options = {
        body: {
          assistant_id: @assistant_id,
          stream: true,
        }.to_json,
        headers: @headers
      }

      response = self.class.post(@path, options)

      puts '#########################'
      puts 'Run Thread'
      puts '#########################'
      puts response

      response
    end
  end
end