Rails.application.routes.draw do
  devise_for :users
  root to: 'olde#index'
end
