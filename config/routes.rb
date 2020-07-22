Rails.application.routes.draw do
  devise_for :users
  root  'top#top'
  resources :users, only:[:index, :edit, :update, :show, :destroy]
  resources :hashtags do
    collection do
      get 'search'
    end
  end
  resources :photos

  get '/photos/hashtags/:name', to: "photos#hashtags"
end
