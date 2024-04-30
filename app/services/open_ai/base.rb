require 'httparty'

module OpenAi
  class Base
    include HTTParty

    base_uri 'https://api.openai.com/v1'

    def initialize(model = 'gpt-3.5-turbo')
      @model = model
      @headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{Rails.application.credentials.openai[:api_key]}"
      }
    end

    def complete(prompt, max_tokens = 50)
      options = {
        body: {
          model: @model,
          messages: [{role: 'user', content: prompt}],
          max_tokens: max_tokens,
        }.to_json,
        headers: @headers
      }
      response = self.class.post('/chat/completions', options)

      response['choices'][0]['message']['content']
    end
  end
end
