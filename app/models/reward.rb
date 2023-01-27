class Reward < ApplicationRecord
  belongs_to :question, dependent: :destroy
  belongs_to :answer, optional: true

  has_one_attached :image

  validates :title, :image, presence: true
  # validate :attached_type

  private 

  def attached_type
    types = ['jpeg', 'png', 'gif']

    if image.attached?
      errors.add(:image, ": Доступные типы файлов для вознаграждения: #{types.join(', ')}") unless image.content_type =~ /^image\/(#{types.join('|')})/
    end
  end  
end
