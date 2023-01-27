class RewardsController < ApplicationController
  before_action :authenticate_user!

  expose :rewards, -> { Reward.all }
  expose :user_rewards, -> { current_user.rewards }

  # expose :reward, ->{ Reward.find(params[:id]) }
  # expose :user
  # expose :rewards, -> { user.rewards }
end
