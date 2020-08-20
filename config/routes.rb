Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/user' => "skills#index", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :skills, only: [:index, :new, :create, :update, :show, :destroy, :edit] do
    resources :bookings, only: [:new, :create, :update, :destroy, :edit, :show, :index] do
       resources :reviews, only: [:index, :new, :create,]
    end
  end

  resources :users, only: [:index, :update, :show] do
    resources :bookings, only: [:show, :index]
  end
  resources :reviews, only: [:show]
end


