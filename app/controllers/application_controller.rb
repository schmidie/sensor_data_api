# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  # authentication - devise
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # authorization - pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  # rescue_from Pundit::NotAuthorizedError do |exception|
  #   raise exception if Rails.env.test?
  #   render status: :unauthorized, json: { exception: exception.to_json }
  # end

  protected

  def configure_permitted_parameters
    # TODO: adjust
    added_attrs = %i[email mac password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def not_implemented
    render status: :not_implemented,
           json: { error: 'this entrypoint is not implemented yet. we are working on it. for more details please contact us.' }
  end
end
