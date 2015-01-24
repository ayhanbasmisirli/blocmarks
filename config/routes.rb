Blocmarks::Application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]

  resources :topics, only: [:index]
  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end
  root to: "welcome#index"

  post 'incoming' => 'incoming#create'

  
end
