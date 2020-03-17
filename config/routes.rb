Rails.application.routes.draw do
  resources :products
  resources :transactions
  resources :taxes
  resources :photos
  devise_for :users

  root to: 'pages#index'

  get 'pages/about'
  get 'pages/activity'
  get 'pages/contact'
  get 'pages/cookies'
  get 'pages/dashboard'
  get 'pages/error'
  get 'pages/faq'
  get 'pages/index'
  get 'pages/invitations'
  get 'pages/invite'
  get 'pages/jobs'
  get 'pages/privacy'
  get 'pages/random'
  get 'pages/terms'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '*path', to: redirect('/pages/error')
end
