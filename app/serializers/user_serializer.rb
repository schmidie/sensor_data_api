# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :created_at, :sign_in_count
  has_many :roles
end
