Flix::Application.routes.draw do

  devise_for :users
  root "movies#index"

  resources :movies do
    resources :reviews
  end

  get "/users/:user_id/favorites", to: "favorites#index", as: "user_favorites"
end
