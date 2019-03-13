# frozen_string_literal: true

# overrides devise registration controller
# all adjustments of registration should be done here
# for custom output here is a good overview for any overrwrites:
# https://github.com/lynndylanhurley/devise_token_auth/blob/master/docs/usage/overrides.md
class RegistrationsController < DeviseTokenAuth::RegistrationsController
  # POST /auth/
  def create
    # TODO: introduce api.secrets file to protect the api & check if hash(secret) exist in api.secrets
    super
  end

  # PUT|PATCH /auth/
  def update
    super
  end

  # DELETE /auth/
  def destroy
    # super
    render status: :unauthorized,
           json: { error: 'you are not allowed to destroy your account. please contact an administrator.' }
  end

  # overrides the response for login (POST /auth/sign_in)
  def render_create_success
    render json: UserSerializer.new(@resource, include: [:roles]).serialized_json
  end
end
