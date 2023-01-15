class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :links, dependent: :destroy

  belongs_to :author, class_name: 'User'

  # Декларация: модель имеет прикрепленные файлы
  has_many_attached :files

  # Makros принимает атрибуты для модели Links, при создании Вопроса создавает ссылки
  accepts_nested_attributes_for :links, reject_if: :all_blank

  validates :title, :body, presence: true  
end
