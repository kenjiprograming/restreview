Rails.application.routes.draw do
  # wantsのルーティング
  resources :wants
  # gonesのルーティング
  resources :gones
  
  # postedsのルーティング
  resources :posteds do
    # likesのルーティング
    resources :likes, only: [:create, :destroy]
  end

  #relationsのルーティング
  post 'relationships/:id', to: 'relationships#create'
  delete'relationships/:id', to: 'relationships#destroy'
  
  #deviseのルーティング
  devise_for :users

  #userのルーティング
  resources :user do
    #followsのルーティング
    resources :follows, only: [:index]
  end
  
  #gurunabiのルーティング
  get 'gurunabi/:id/show', to: 'gurunabi#show'
  get 'gurunabi/search', to: 'gurunabi#search'

  root 'posteds#index'
end
