require 'sidekiq/web'

Rails.application.routes.draw do
  

  resources :recipes, :shallow => true do
    resources :recipe_ingredient_groups, :shallow => true do
      resources :recipe_ingredients
    end
  end

  resources :ingredients
  

  resources :ingredient_categories

  
  resources :pins

  get '/feed', to: 'pins#feed'

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'pins#feed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
