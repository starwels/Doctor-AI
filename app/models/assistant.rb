class Assistant < ApplicationRecord
  has_many :chats
  has_many :assistant_archives
  has_many :archives, through: :assistant_archives
end
