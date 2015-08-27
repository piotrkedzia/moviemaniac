App::Application.routes.draw do

  devise_for :users
  root "movies#index"

  resources :movies do
    resources :reviews
  end

  get "/favorites/:user_id", to: "movies#user_favorites", as: "user_favorites"
  get "/favorite/toggle/:movie_id", to: "movies#toggle", as: "toggle_favorite"
end
