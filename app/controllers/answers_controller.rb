class AnswersController < ApplicationController
  include Voted

  before_action :authenticate_user!, only: [:create]
  after_action :publish_answer, only: [:create]
  # after_action :publish_answer, only: [:create, :destroy, :update]
  
  expose :answers, -> { Answer.all }
  expose :answer,  -> { params[:id] ? Answer.with_attached_files.find(params[:id]) : Answer.new }
  expose :question, -> { Question.find(params[:question_id]) }

  def create
    @answer = question.answers.new(answer_params)
    @answer.author = current_user
    @answer.save
  end

  def update
    answer.update(answer_params) if current_user.author_of?(answer)
    @question = answer.question
    
    #if current_user.author_of?(answer)
    #  answer.update(answer_params)
    #else
    #  redirect_to @question, notice: 'You have no rights to do this.'
    #end
  end

  def destroy
    answer.destroy if current_user.author_of?(answer)

    #if current_user.author_of?(answer)
    #  answer.destroy
    #  # redirect_to answer.question, notice: 'Your answer was successfully deleted.'
    #else
    #  redirect_to answer.question, notice: 'You have no rights to do this.'
    #end
  end

  def best
    #answer = Answer.find(params[:id])
    #answer.make_best if current_user.author_of?(answer.question)
    #@question = answer.question

    if current_user.author_of?(answer.question)
      answer.make_best
    else
      redirect_to answer.question, notice: 'You have no rights to do this.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body,
      # Voted::STRONG_PARAMS,
      files: [],
      links_attributes: [:name, :url, :id, :_destroy]
    )
  end

  def publish_answer
    return if answer.errors.any?

    ActionCable.server.broadcast(
      "answers_question_#{question.id}",
      answer: answer,
      files: cable_files(answer),
      links: cable_links(answer)
    )
  end

end
