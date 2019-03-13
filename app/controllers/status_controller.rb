# frozen_string_literal: true

class StatusController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    skip_policy_scope
    render status: :ok,
           json: StatusSerializer.new(Status.instance).serialized_json
  end
end
