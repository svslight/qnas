class Question < ApplicationRecord
  include Authorable
  include Linkable
  include Votable

  # belongs_to :author, class_name: 'User'
  
  # has_many :links, dependent: :destroy, as: :linkable
  # has_many :votes, dependent: :destroy, as: :votable

  has_many :answers, dependent: :destroy
  has_one :reward, dependent: :destroy

  # Декларация: модель имеет прикрепленные файлы
  has_many_attached :files

  # Makros принимает атрибуты для модели Links, при создании Вопроса создавать ссылки
  # accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :reward, reject_if: :all_blank, allow_destroy: true

  validates :title, :body, presence: true
end
