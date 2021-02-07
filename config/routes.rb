# frozen_string_literal: true

Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users,
             controllers: {
               registrations: 'registrations',
               confirmations: 'confirmations',
               passwords: 'passwords',
               sessions: 'sessions',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }
  # post 'users/auth/:provider', to: 'sessions#create'

  resources :announcements
  resources :blacklists
  resources :categories
  resources :carts
  resources :contacts
  resources :faqs
  resources :photos

  resources :products do
    member { post :add_to_cart }
  end

  resources :products do
    member do
	      put "Like" => "products#upvote"
        put "Unlike" => "products#downvote"
      end
    end


  resources :notifications
  resources :taxes
  resources :todo_lists
  resources :transactions

  resources :troubletickets, only: %i[index edit update destroy]

  resources :troubletickets do
    resources :ticketnotes, only: %i[new create destroy]
  end

  resources :watchlists, only: %i[index new create destroy]

  get 'troubletickets_close/(:id)', to: 'troubletickets#close'


   resources :feedbacks, only: %i[index edit update destroy]

  resources :transactions do
    resources :feedbacks, only: %i[new create]
  end

  resources :vendors

  get 'feedbacks/feedback_left'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  mount StripeEvent::Engine, at: '/stripe/webhooks'

  get 'pages/about'
  get 'pages/banned'
  get 'pages/contact'
  get 'pages/carousel'
  get 'pages/cookies'
  get 'pages/dashboard'
  get 'pages/error'
  get 'pages/index'  # recently added
  get 'pages/index2' #last change
  get 'pages/invitations'
  get 'pages/invite'
  get 'pages/jobs'
  get 'pages/lola'
  get 'pages/payments'
  get 'pages/privacy'
  get 'pages/random'
  get 'pages/random2'
  get 'pages/resume'
  get 'pages/terms'
  get 'pages/thankyou'
  get 'pages/shipping'
  get 'pages/returns'
  get 'pages/taxes'

  post 'pages/resume'
  get 'pages/thankyouhiringmanager'


  resources :newsletters, only: %i[index]

  get 'download_pdf', to: "pages#download_pdf"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # comments engine
  mount Commontator::Engine => '/commontator'

  get '*path', to: redirect('/pages/error')
end
