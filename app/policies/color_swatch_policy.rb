class ColorSwatchPolicy < ApplicationPolicy
  def create?
    record.version.project.artist == user || record.version.project.customer == user
  end

end
