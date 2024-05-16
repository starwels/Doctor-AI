class Message < ApplicationRecord
  belongs_to :chat

  enum :origin, user: 0, ai: 1

  after_update_commit -> { broadcast_replace_to "messages", partial: "messages/response", locals: { message: self }, target: id }
end
