WdiFinalProject::Application.routes.draw do
  devise_for :users
  root to: 'journeys#index'

  resources :journeys do
    resources :posts, except: [:index]
  end

  # resources :messages
end
