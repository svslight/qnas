class Answer < ApplicationRecord
  include Authorable
  include Linkable
  include Votable

  # belongs_to :author, class_name: 'User'

  belongs_to :question
  has_one :reward

  # has_many :links, dependent: :destroy, as: :linkable
  # has_many :votes, dependent: :destroy, as: :voteable

  # Makros принимает атрибуты для модели Links, при создании Ответа создавает ссылки
  # accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  has_many_attached :files

  validates :body, presence: true

  default_scope { order(best: :desc, created_at: :desc) }
  scope :get_best, -> { where(best: true) }

  def make_best
    transaction do
      question.answers.get_best.take&.update!(best: false)
      update!(best: true)
      update!(reward: question.reward) if question.reward.present?
    end
  end

  # def rating
  #  self.votes.sum(:value)
  # end
end
