Rails.application.routes.draw do
  use_doorkeeper
  
  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks' }

  # namespace :user do
  #   get '/oauth_adding_email', to: 'emails#new'
  #   post '/oauth_adding_email', to: 'emails#create'
  # end

  concern :votable do
    member do
      patch :vote
    end
  end

  concern :commentable do
    resource :comments, only: %i[create]
  end

  resources :questions, concerns: [:votable, :commentable] do
    resources :answers, concerns: [:votable, :commentable], shallow: true, only: %i[create update destroy] do
      member do
        patch :best
      end
    end
  end

  resources :files, only: %i[destroy]
  resources :links, only: :destroy

  resources :users do
    resources :rewards, shallow: true, only: %i[index show]
  end

  root to: 'questions#index'

  mount ActionCable.server => '/cable'

end
