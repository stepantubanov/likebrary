Likebrary::Application.routes.draw do
  devise_for :users

  resources :books do
    resources :ratings, only: [:update]
  end

  root to: 'books#index'
end
