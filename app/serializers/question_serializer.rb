class QuestionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :body, :created_at, :updated_at, :author_id, :short_title
  has_many :links
  has_many :files
  has_many :comments

  # включение коллекции ответов
  has_many :answers

  # для отвельных ассоциаций (включают одноименную ассоциацию в наш объект)
  # belongs_to :user

  def short_title
    object.title.truncate(7)
  end

  def files
    object.files.map do |file|
      rails_blob_path(file, only_path: true)
    end
  end
end
