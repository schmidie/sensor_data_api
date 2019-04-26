# frozen_string_literal: true

class SensorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user&.is_admin? ? scope.all : scope.none
    end
  end

  def show?
    user&.is_admin? || user == record
  end
end
