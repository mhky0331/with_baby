class Ability < ApplicationRecord
  include CanCan::Ability

  def initialize(user)
    if user.is_active?
      can :manage, Facility
    else
      cannot :manage, Facility
    end
  end
end
