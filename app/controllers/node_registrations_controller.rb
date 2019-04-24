# frozen_string_literal: true

# overrides devise registration controller
# all adjustments of registration should be done here
# for custom output here is a good overview for any overrwrites:
# https://github.com/lynndylanhurley/devise_token_auth/blob/master/docs/usage/overrides.md
class NodeRegistrationsController < DeviseTokenAuth::RegistrationsController
  # POST /node_auth/
  def create
    # TODO: find a way to have a devise_user model without email address
    # see: https://github.com/lynndylanhurley/devise_token_auth/issues/563
    # TODO: connect user&node (path user-email with node-signup)
    # params.merge!({email: "#{params[:mac]}.user@user.de"})

    # TODO: introduce api.secrets file to protect the api & check if hash(secret) exist in api.secrets
    super
  end

  # PUT|PATCH /node_auth/
  def update
    super
  end

  # DELETE /node_auth/
  def destroy
    # super
    render status: :unauthorized,
           json: { error: 'you are not allowed to destroy your account. please contact an administrator.' }
  end

  # overrides the response for login (POST /node_auth/sign_in)
  # def render_create_success
  #   render json: UserSerializer.new(@resource, include: [:roles]).serialized_json
  # end
end
