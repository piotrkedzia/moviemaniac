Flix::Application.routes.draw do

  devise_for :users
  root "movies#index"

  resources :movies do
    resources :reviews
  end

  get "/favorites/:user_id", to: "favorites#index", as: "user_favorites"
  get "/favorite/toggle/:movie_id", to: "favorites#toggle", as: "toggle_favorite"
end
