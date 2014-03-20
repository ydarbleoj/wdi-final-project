WdiFinalProject::Application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :journies do
    resources :posts
  end
end
