# frozen_string_literal: true

class RoleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  # TODO: if we use resource based roles we should introduce this here.
end
