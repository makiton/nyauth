module Nyauth
  module Route
    def nyauth_concerns
      concern :nyauth_registrable do
        resource :registration, only: %i(new create)
      end
      concern :nyauth_sessionable do
        resource :session, only: %i(new create destroy)
      end
      concern :nyauth_passwordable do
        resource :password, only: %i(edit update)
        resources :reset_password_requests, only: %i(new create)
        resources :reset_passwords, param: :reset_password_key, only: %i(edit update)
      end
      concern :nyauth_confirmable do
        resources :confirmation_requests, only: %i(new create)
        get '/confirmations/:confirmation_key' => 'confirmations#update', as: :confirmation
      end
    end
  end
end
