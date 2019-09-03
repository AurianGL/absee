class VersionPolicy < ApplicationPolicy
   class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    record.project.artist == user || record.project.customer == user
  end

  def update?
    record.project.artist == user || record.project.customer == user
  end
end
