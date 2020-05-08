Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'pages#home'
    resources :spots, only: [:new, :create, :index, :show] do
      resources :reviews, only: [:create, :destroy]
    end
end
