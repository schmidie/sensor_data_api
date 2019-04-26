# frozen_string_literal: true

class UnityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user&.is_admin? ? scope.all : scope.none
    end
  end

  def index?
    user&.is_admin? || user == record
  end

  def show?
    user&.is_admin? || user == record
  end

  def create?
    user&.is_admin? || user == record
  end

  def create_node?
    user&.is_admin? || user == record
  end

  def get_nodes?
    user&.is_admin? || user == record
  end
end
