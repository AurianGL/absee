class ProjectPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    record.customer == user || record.artist == user
    # - record: the project passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.customer == user || record.artist == user
  end
end
