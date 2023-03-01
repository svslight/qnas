class AnswersController < ApplicationController
  include Voted

  before_action :authenticate_user!, only: [:create]
  
  # after_action :publish_answer, only: [:create, :destroy, :update]
  
  expose :answers, -> { Answer.all }
  expose :answer,  -> { params[:id] ? Answer.with_attached_files.find(params[:id]) : Answer.new }
  expose :question, -> { Question.find(params[:question_id]) }

  authorize_resource

  after_action :pub_answer, only: [:create]  

  def create
    @answer = question.answers.new(answer_params)
    @answer.author = current_user
    @answer.save
  end

  def update
    # answer.update(answer_params) if current_user.author_of?(answer)
    @question = answer.question
    may?(answer) ? answer.update(answer_params) : no_rights(@question)
    
    #if current_user.author_of?(answer)
    #  answer.update(answer_params)
    #else
    #  redirect_to @question, notice: 'You have no rights to do this.'
    #end
  end

  def destroy
    authorize! :destroy, answer
    
    may?(answer) ? answer.destroy : no_rights(answer.question)
    # answer.destroy if current_user.author_of?(answer)

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

    may?(answer.question) ? answer.make_best : no_rights(answer.question)

    # if current_user.author_of?(answer.question)
    #   answer.make_best
    # else
    #   redirect_to answer.question, notice: 'You have no rights to do this.'
    # end
  end

  private

  def answer_params
    params.require(:answer).permit(:body,
                                  Voted::STRONG_PARAMS,
                                  files: [],
                                  links_attributes: [:name, :url, :id, :_destroy]
                                  )
  end

  def pub_answer
    return if answer.errors.any?

    AnswersChannel.broadcast_to(
      @answer.question,
      answer: @answer,
      files: @answer.files.map { |file| { id: file.id, name: file.filename.to_s, url: url_for(file) } },
      links: @answer.links.select(&:persisted?)
    )
  end

end
