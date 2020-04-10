Rails.application.routes.draw do

  resources :feedbacks,  only:[:index]
  root 'pages#index'

  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations', passwords: 'passwords', sessions: 'sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :blacklists
  resources :categories
  resources :carts
  resources :contacts
  resources :photos

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :notifications
  resources :taxes
  resources :transactions do

      resources :feedbacks , only:[:new,:create,:edit,:update,:destroy]
  
  end


  scope '/checkout' do
  post 'create', to: 'checkout#create',   as: 'checkout_create'
   get 'cancel', to: 'checkout#cancel',   as: 'checkout_cancel'
   get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  get 'pages/about'
  get 'pages/banned'
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
  get 'pages/taxes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #comments engine
  mount Commontator::Engine => '/commontator'

  get '*path', to: redirect('/pages/error')
end
