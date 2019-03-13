# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # for now we only have global roles
      # if someone has admin rights he/she has it for all records
      # it could make sence to introduce resource-based roles: https://github.com/RolifyCommunity/rolify/wiki/Usage
      user&.is_admin? ? scope.all : scope.none
    end
  end

  def index?
    user&.is_admin?
  end

  def show?
    user&.is_admin? || user == record
  end

  def update?
    user&.is_admin? || user == record
  end

  def destroy?
    false
  end
end
