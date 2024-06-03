class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :assistant

  has_many :messages, dependent: :destroy
  has_many :clinical_cases, dependent: :destroy
end
