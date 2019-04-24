Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/status', to: 'status#index'
  root to: 'status#index'

  scope '/v1' do
    resources :users, only: [:index]
    # mount_devise_token_auth_for 'User', at: 'auth'
    mount_devise_token_auth_for 'User', at: 'auth',
      controllers: {registrations: :registrations, sessions: :sessions}

    mount_devise_token_auth_for 'Node', at: 'node_auth',
      controllers: {registrations: :node_registrations, sessions: :node_sessions}

  end
  # for swagger docs
  resources :docs, only: [:index]
end
