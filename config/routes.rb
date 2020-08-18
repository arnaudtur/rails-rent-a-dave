Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/user' => "skills#index", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :skills, only: [:index, :new, :create, :update, :show]


end
