# frozen_string_literal: true

class StatusSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :state
end
