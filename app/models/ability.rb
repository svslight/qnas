# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user
		
  def initialize(user)
    @user = user   

    return guest_abilities unless user
    user.admin? ? admin_abilities : user_abilities   # Тринарный оператор
    
    # if user
    #   user.admin? ? admin_abilities : user_abilities
    # else
    #   guest_abilities
    # end
  end

  def guest_abilities
    can :read, :all
  end

  def admin_abilities
    can :manage, :all
  end

  def user_abilities
    guest_abilities
    can :create, [Question, Answer, Comment]
    can :update, [Question, Answer], author_id: user.id
  end

    # Define abilities for the user here. For example:
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all

end
