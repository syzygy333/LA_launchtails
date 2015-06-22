Rails.application.routes.draw do
  root 'featured_drinks#index'
  devise_for :users
  resources :drinks
  resources :categories, only: [:index, :show] do
    resources :drinks, only: [:index, :show]
  end
  get 'featured-drinks', to: 'featured_drinks#drinks,'

end
