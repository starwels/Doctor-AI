class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :chats, dependent: :nullify
  has_many :messages, through: :chats, dependent: :nullify

  enum role: { user: 0, admin: 1 }
end
