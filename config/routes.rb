Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/status', to: 'status#index'
  root to: 'status#index'

  scope '/v1' do
    # devise authentication routes
    mount_devise_token_auth_for 'User', at: 'auth',
      controllers: {registrations: :registrations, sessions: :sessions}
    mount_devise_token_auth_for 'Node', at: 'node_auth',
      controllers: {registrations: :node_registrations, sessions: :node_sessions}

    # user routes
    # GET /v1/users/
    resources :users, only: %i[index]

    # unity routes
    # GET /v1/unities/
    # POST /v1/unities/
    # GET /v1/unities/<id>
    resources :unities, only: %i[show index create] do
      member do
        # POST /v1/unities/<id>/node
        post :nodes
        # GET /v1/unities/<id>/nodes
        get :nodes
      end
    end

    # node routes
    # GET /v1/nodes/<id>
    resources :nodes, only: %i[show] do
      # POST /v1/nodes/<id>/sensors
      resources :sensors, only: [:create]
    end
  end

  # for swagger docs
  resources :docs, only: [:index]
end
