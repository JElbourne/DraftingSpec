require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
  end

  resources :projects

  get '/support', to: 'home#support'
  get '/terms', to: 'home#terms'
  get '/privacy', to: 'home#privacy'
  get '/about', to: 'home#about'
  get '/pricing', to: 'home#pricing'
  get '/review', to: 'home#review'
  get '/tools', to: 'home#tools'
  get '/blog', to: 'home#blog'
  get '/permit', to: 'home#permit'
  get '/designs', to: 'home#designs'
  get '/podcast', to: 'home#podcast'
  get '/merch', to: 'home#merch'
  get '/answers', to: 'home#answers'
  get '/community', to: 'home#community'

  # get 'courses/tagged/:tag', to: 'courses#index', as: :courses_tag
  # get 'lessons/tagged/:tag', to: 'lessons#index', as: :lessons_tag

  post '/newsletter', to: 'mailchimp#newsletter', as: 'newsletter'


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
