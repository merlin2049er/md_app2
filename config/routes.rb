Rails.application.routes.draw do

  #devise_for :users
  root to: 'pages#index'
  #devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations', passwords: 'passwords' omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations', sessions: 'sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
     get 'register', to: 'devise/registrations#new', as: :register
     get 'login', to: 'devise/sesssions#new', as: :login
     get 'logout', to: 'devise/sesssions#destroy', as: :logout
   end

  resources :carts
  resources :contacts
  resources :categories
  resources :products
  resources :transactions
  resources :taxes
  resources :photos
  resources :notifications



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
  get 'pages/shipping'
  get 'pages/returns'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '*path', to: redirect('/pages/error')
end
