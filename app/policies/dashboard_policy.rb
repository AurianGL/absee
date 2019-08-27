class DashboardPolicy < ApplicationPolicy
  def show?
    true
    # - record: the project passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
end
