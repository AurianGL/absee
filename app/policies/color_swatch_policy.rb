class ColorSwatchPolicy < ApplicationPolicy
  def create?
    record.version.project.artist == user
  end

end
