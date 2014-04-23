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

  # TODO: this could be set up better - maybe with a follows controller
  get "/users/:id/following", to: 'users#following'
  get "/users/:id/followers", to: 'users#followers'
  post "/users/:id/followers", to: 'users#follow'
  delete "/users/:id/followers", to: 'users#unfollow'

  resources :messages

end
