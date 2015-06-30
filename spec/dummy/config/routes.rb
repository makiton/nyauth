Rails.application.routes.draw do
  namespace :nyauth, path: :admin, as: :admin do
    concerns :nyauth_sessionable
  end
  mount Nyauth::Engine, at: '/', as: :nyauth

  resources :posts, only: %i(index)
  root 'pages#index'
end
