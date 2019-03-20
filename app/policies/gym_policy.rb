class GymPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
#¿quien puede crear un restaurante?
  def new?
    return true
    #todo el mundo

  end

  def create?
    return new?

  end

  def show?
    #everyone can see a restaurant
    return true

  end

  def update?
    record.user == user

  end

  def destroy?
    user_is_owner?

  end

  private

  def user_is_owner?
    record.user == user

  end



end
