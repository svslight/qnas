class Api::V1::ProfilesController < ApplicationController

  before_action :doorkeeper_authorize!

  def me
    # head :ok
    render json: current_resource_owner
  end

  # def index
  #   @users = User.where.not(id: current_resource_owner)
  #   render json: @users
  # end

  private
		  
  def current_resource_owner
    current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end
