module Voted
  extend ActiveSupport::Concern

  # STRONG_PARAMS = %i[ :vote ].freeze

  included do
    # before_action :set_votable, only: :vote
    before_action :set_voteable, only: %i[vote_up vote_down]
  end

  def vote_up
    vote(1)
  end

  def vote_down
    vote(-1)
  end

  # def vote
  #   respond_to do |format|
  #     if current_user.author_of?(@votable)
  #       format.json { render json: { errors: "#{@votable.class}-author cannot vote" }, status: :unprocessable_entity }
  #     else
  #       vote = Vote.find_or_initialize_by(author: current_user, votable: @votable)
  #       vote.voting(params[:vote].to_i)
  #       format.json { render json: { rating: "#{@votable.rating}" } }
  #     end
  #   end
  # end

  def vote(value)
    return anauthorized! if current_user.author?(@voteable)
    if vote = @voteable.votes.find_by(user: current_user)
      vote.update(value: value)
    else
      @voteable.votes.create(user: current_user, value: value)
    end
    render json: { rating: @voteable.votes.sum(:value), id: @voteable.id }
  end

  def anauthorized!
    render json: { error: "You can not vote for your #{model_klass.to_s.downcase}" }, status: 403
  end

  private

  def model_klass
    controller_name.classify.constantize
  end

  def set_votable
    @votable = model_klass.find(params[:id])
  end
end
