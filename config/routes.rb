Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {}

      namespace :auth do
        resources :sessions, only: [:index]
      end

      resource :user, only: %i[update show] do
        put :update_positions
      end

      resources :users do
        get 'show_current_user_id', on: :member
        get 'following_users', on: :member
        get 'followers_users', on: :member
        get 'show_by_user_id', on: :collection
        get 'show_user_id_data', on: :collection
        resources :awards, only: %i[create index destroy update]
      end

      resources :relationships, only: %i[create destroy]

      resources :positions, only: %i[index show]

      resources :user_positions, only: [:create]

      resources :teams, only: %i[index create update team_name] do
        member do
          get :team_name
        end
      end

      resources :baseball_categories, only: [:index]

      resources :prefectures, only: [:index]

      resources :match_results do
        collection do
          get :current_user_match_index
        end
      end

      resources :tournaments, only: %i[index create update show]

      resources :game_results, only: %i[create update] do
        member do
          put :update_batting_average_id
          put :update_pitching_result_id
        end
        collection do
          get :game_associated_data_index
          get :game_associated_data_index_user_id
          get :filtered_game_associated_data
          get :filtered_game_associated_data_user_id
        end
      end

      resources :batting_averages, only: %i[index create update] do
        collection do
          get :personal_batting_average
          get :personal_batting_stats
        end
      end

      resources :plate_appearances, only: %i[create update]

      resources :pitching_results, only: %i[index create update] do
        collection do
          get :personal_pitching_result
          get :personal_pitching_stats
        end
      end

      resources :groups, only: %i[index create]

      get 'users/current', to: 'users#show_current'
      get 'search', to: 'batting_averages#search'
      get 'match_index_user_id', to: 'match_results#match_index_user_id'
      get 'existing_search', to: 'match_results#existing_search'
      get 'plate_search', to: 'plate_appearances#plate_search'
      get 'pitching_search', to: 'pitching_results#pitching_search'
      get 'current_game_result_search', to: 'match_results#current_game_result_search'
      get 'current_batting_average_search', to: 'batting_averages#current_batting_average_search'
      get 'current_pitching_result_search', to: 'pitching_results#current_pitching_result_search'
      get 'current_plate_search', to: 'plate_appearances#current_plate_search'
      get 'current_plate_search_user_id', to: 'plate_appearances#current_plate_search_user_id'
    end
  end

  devise_for :users, controllers: {
    confirmations: 'custom_confirmations'
  }
end
