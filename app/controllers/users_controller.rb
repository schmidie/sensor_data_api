# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    collection        = User.all
    scoped_collection = policy_scope(collection)

    render status: :ok,
           json: UserSerializer.new(scoped_collection, include: [:roles]).serialized_json
  end
end
