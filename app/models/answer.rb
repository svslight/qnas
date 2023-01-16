class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :author, class_name: 'User'

  has_many :links, dependent: :destroy, as: :linkable

  has_many_attached :files

  # Makros принимает атрибуты для модели Links, при создании Ответа создавает ссылки
  accepts_nested_attributes_for :links, reject_if: :all_blank

  validates :body, presence: true

  default_scope { order(best: :desc, created_at: :desc) }
  scope :get_best, -> { where(best: true) }

  def make_best
    transaction do
      question.answers.get_best.take&.update!(best: false)
      update!(best: true)
    end
  end

end
