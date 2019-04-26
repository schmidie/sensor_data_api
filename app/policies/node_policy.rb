# frozen_string_literal: true

class NodePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user&.is_admin? ? scope.all : scope.none
    end
  end

  def show?
    user&.is_admin? || user == record
  end

  def create_sensor?
    user&.is_admin? || user == record
  end

  def get_sensors?
    user&.is_admin? || user == record
  end
end
