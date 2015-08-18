Rails.application.routes.draw do
  root 'bills#new'
  resources :bills, only: [:show, :create, :update]
  resources :competences, only: [:create]
  resources :learning_goals, only: [:create]
end
