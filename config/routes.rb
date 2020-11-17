Rails.application.routes.draw do
  post 'posteds/:id/likes/create', to: 'likes#create'
  delete '/posteds/:id/likes/destroy', to: 'likes#destroy'

  get 'posteds/:id', to: 'posteds#show'
  delete 'posteds/:id', to: 'posteds#destroy'

  get 'followers/:id/index', to: "followers#index"
  get 'followings/:id/index', to: "followings#index"

  post 'relationships/:id', to: 'relationships#create'
  delete'relationships/:id', to: 'relationships#destroy'

  devise_for :users

  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show'

  post 'gurunabi/:id/create', to: 'gurunabi#create'
  get 'gurunabi/:id/show', to: 'gurunabi#show'
  get 'gurunabi/search', to: 'gurunabi#search'
  get 'gurunabi/hoge', to: 'gurunabi#hoge'
  get 'search', to: 'search#search'

  root 'home#index'
end
