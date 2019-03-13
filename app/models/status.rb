# frozen_string_literal: true

require 'singleton'

# Status class (Singleton)
# the status of the api should be tracked
# so any client can request the status and act if the api is not running
# The state can be set anywhere if something happens which affect the api-state
## STATI
## :running => everythink ok
class Status
  include Singleton

  attr_accessor :state
  attr_reader :id

  def initialize
    @state = :running
  end

  def time
    Time.current
  end
end
