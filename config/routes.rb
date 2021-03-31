require 'sidekiq/web'

Rails.application.routes.draw do

  # resources :days
  resources :meal_plans, :shallow => true do
    get 'create_shopping_list'
    get 'delete_shopping_list'
    resources :shopping_list_items do
      get 'toggle_tick'
    end
    resources :days, :shallow => true do
      resources :meals, :shallow => true do
        resources :meal_recipes
        resources :meal_ingredients
      end
    end
  end

  resources :recipes, :shallow => true do
    resources :recipe_ingredient_groups, :shallow => true do
      resources :recipe_ingredients
    end
  end

  resources :meal_recipes do
      get 'double_portions'
      get 'half_portions'
      get 'add_one_portion'
  end

  get '/today', to: 'days#index'

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
  root to: 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
