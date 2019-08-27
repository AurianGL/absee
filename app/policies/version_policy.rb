class VersionPolicy < ApplicationPolicy
  def create?
    record.project.artist == user
  end

end
