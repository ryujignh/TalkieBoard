Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :categories do
    resources :items, controller: 'category_items'
  end

  resources :locale, only: [:show]
  resource :switch_language, only: [:update]
end
