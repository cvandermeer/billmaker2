Rails.application.routes.draw do
  root 'bills#new'
  resources :bills, only: [:new, :show, :create]
end
