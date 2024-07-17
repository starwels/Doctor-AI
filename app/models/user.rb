class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :chats, dependent: :nullify
  has_many :messages, through: :chats, dependent: :nullify

  enum role: { user: 0, admin: 1 }

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :phone_number,  presence: true

  def full_name
    first_name + ' ' + last_name
  end
end
