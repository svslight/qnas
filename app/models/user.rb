class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]   # добавить провайдера

  has_many :author_questions, foreign_key: 'author_id', class_name: 'Question'
  has_many :author_answers, foreign_key: 'author_id', class_name: 'Answer'
  has_many :author_votes, foreign_key: 'author_id', class_name: 'Vote'
  has_many :author_comments, foreign_key: 'author_id', class_name: 'Comment'
  has_many :rewards, through: :author_answers
  has_many :authorizations, dependent: :destroy
  
  def author_of?(resource)
    id == resource.author_id
  end

  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s).first
    return authorization.user if authorization

    email = auth.info[:email]
    user = User.where(email: email).first

    if user
      user.create_authorization(auth)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, password: password, password_confirmation: password)
      user.create_authorization(auth)
    end
    user

    # Services::FindForOauth.new(auth).call
    # Services::FindForOauth.call(auth)
  end

  def create_authorization(auth)
    self.authorizations.create(provider: auth.provider, uid: auth.uid)
  end
end
