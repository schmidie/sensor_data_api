# frozen_string_literal: true

# overrides devise session controller
# any adjustments to the login-process should be done here.
# for custom output here is a good overview for any overrwrites:
# https://github.com/lynndylanhurley/devise_token_auth/blob/master/docs/usage/overrides.md
class SessionsController < DeviseTokenAuth::SessionsController
  # POST /auth/sign_in
  def create
    super
  end

  # GET /auth/sign_in
  def new
    super
  end

  # DELETE /auth/sign_out
  def destroy
    super
  end

  # overrides the response for login (POST /auth/sign_in)
  def render_create_success
    render json: UserSerializer.new(@resource, include: [:roles]).serialized_json
  end
end
