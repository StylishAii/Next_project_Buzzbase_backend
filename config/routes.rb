Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {}

      namespace :auth do
        resources :sessions, only: [:index]
      end

      resource :user, only: [:update, :show]
    end
  end
end
