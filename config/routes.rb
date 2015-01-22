Blocmarks::Application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics 
  resources :bookmarks
  
   root to: "welcome#index"

  
end
