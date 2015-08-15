Flix::Application.routes.draw do

  devise_for :users
  root "movies#index"

  resources :movies do
    resources :reviews
  end

  get "/all_favorites", to: "favorites#all"
end
