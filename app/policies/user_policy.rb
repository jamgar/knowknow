class UserPolicy < ApplicationPolicy
  def index?
    user.present? && user.manager? || user.present? && user.admin?
  end

  def create?
    user.present? && user.manager?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.manager?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.manager?
  end
end
