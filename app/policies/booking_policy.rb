class BookingPolicy < ApplicationPolicy
  class Scope < Scope
  def resolve
      scope.all
  end
  
  end

  def create?
    true
  end

  def new?
    true
  end

  def index?
    true
  end

  def show?
   true
  end

  def edit?
    record.user == user
  end


  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
