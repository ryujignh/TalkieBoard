Rails.application.routes.draw do
  get 'food_category_items/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :contacts, only: [:new, :create]

  resources :categories do
    resources :items, controller: 'category_items'
  end

  resources :food_categories, only: [:index] do
    resources :items, controller: 'food_category_items', only: [:index]
  end

  resources :locale, only: [:show]
  resource :switch_language, only: [:update]
end
