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
        # POST /v1/unities/<id>/create_node
        post :create_node
        # GET /v1/unities/<id>/get_nodes
        get :get_nodes
      end
    end

    # node routes
    # GET /v1/nodes/<id>
    resources :nodes, only: %i[show] do
      member do
        # POST /v1/nodes/<id>/create_sensor
        post :create_sensor
        # GET /v1/nodes/<id>/get_sensors
        get :get_sensors
      end
    end

    # sensor routes
    # GET /v1/sensors/<id>
    resources :sensors, only: %i[show]
  end

  # for swagger docs
  resources :docs, only: %i[index]
end
