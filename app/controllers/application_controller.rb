class ApplicationController < ActionController::Base
  
  # before_action :authenticate_user!, unless: :devise_controller?

  before_action :gon_user, unless: :devise_controller?

  def may?(resource)
    current_user.author_of?(resource)
  end

  def no_rights(resource)
    redirect_to resource, alert: 'You have no rights to do this.'
  end

  private

  def gon_user
    gon.user_id = current_user.id if current_user
  end
end
