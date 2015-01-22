Blocmarks::Application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics do 
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, except: [:new, :create]
  
   root to: "welcome#index"

  
end
