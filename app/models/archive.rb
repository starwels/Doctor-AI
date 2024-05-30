class Archive < ApplicationRecord
  has_many :assistant_archives
  has_many :assistants, through: :assistant_archives

  has_one_attached :pdf

  validate :pdf_content_type

  def pdf_content_type
    if pdf.attached? && !pdf.content_type.in?(%w(application/pdf))
      errors.add(:pdf, 'tem que ser em formato PDF')
    elsif pdf.attached? == false
      errors.add(:pdf, 'não pode ficar vazio')
    end
  end
end
