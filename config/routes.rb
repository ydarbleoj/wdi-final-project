WdiFinalProject::Application.routes.draw do
  get "welcome/index"
  devise_for :users
  root to: 'welcome#index'

  resources :journeys do
    resources :posts
  end

  get "/getImage", to: 'posts#render_new_photo'
  get "/current-user", to: 'users#get_current_user'
  get "/users/:id", to: 'users#show'

  resources :messages

end
