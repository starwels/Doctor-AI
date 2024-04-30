class Message < ApplicationRecord
  belongs_to :chat

  enum :origin, user: 0, ai: 1
end
