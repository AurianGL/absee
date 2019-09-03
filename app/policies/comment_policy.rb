class CommentPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    record.version.project.artist == user || record.version.project.customer == user
  end
end
