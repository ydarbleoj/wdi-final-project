WdiFinalProject::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :journeys, except: [:new, :edit] do
    resources :posts
  end

  resources :messages
end
