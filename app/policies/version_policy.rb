class VersionPolicy < ApplicationPolicy
  def create?
    record.project.artist == user || record.project.customer == user
  end

  def update?
    record.project.artist == user || record.project.customer == user
  end
end
