Rails.application.routes.draw do
  devise_for :users
  root  'top#index'
  resources :top, :only => :index
  resources :users, only:[:index, :edit, :update, :show, :destroy] do
    resources :bookmarks, only: :index
  end
  resources :photos do
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :hashtags, :except => :show do
    collection do
      get 'search'
    end
  end
  resources :maps, only: :index
  get '/hashtags/:hashname', to: 'hashtags#show'
  get '/olde/map', to: 'olde#map'
  # get '/photos/:id/:user_id', to: 'photos#show'
  get '/photos/hashtags/:name', to: "photos#hashtags"
end
