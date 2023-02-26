class DocumentPolicy < ApplicationPolicy
  def index?
   true
  end

  def show?
   true
  end

  def create?
   true
  end

  def new?
    create?
  end

  def update?
    user.present? && user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user == record.user
  end
end
