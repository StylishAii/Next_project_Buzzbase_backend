Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount_devise_token_auth_for 'User', at: 'auth'
end
