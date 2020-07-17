Rails.application.routes.draw do
  devise_for :users
  root  'top#top'
  resources :users, only:[:edit, :update]
  resources :olde
end
