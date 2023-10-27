Rails.application.routes.draw do
  resources :characteristics
  resources :cars do
    resources :comments
  end
  devise_for :users
  get 'terms_and_conditions/index'
  get 'about/index'

  root "home#index"
end
