WdiFinalProject::Application.routes.draw do
  get "welcome/index"
  devise_for :users
  root to: 'welcome#index'

  resources :journeys do
    resources :posts, except: [:index]
  end

  resources :messages

end
