class QuestionsController < ApplicationController
  include Voted

  before_action :authenticate_user!, except: %i[index show]
  # before_action -> { question.links.build }, only: [:new, :create]
  
  # before_action :set_question, only: [:show, :destroy, :update]

  # Передача данных в stream
  after_action :pub_question, only: [:create]

  expose :questions, -> { Question.all.order(created_at: :desc) }
  expose :question, -> { params[:id] ? Question.with_attached_files.find(params[:id]) : Question.new }
  expose :answer, -> { Answer.new }

  def new
    # @question = Question.new
    question.links.new # .build
    question.reward = Reward.new
  end

  def show
    # @answer = Answer.new
    answer.links.new
  end

  def create
    # create - сохранение сразу в базу а нужно условное сохранение
		# @question = Question.create(question_params)    
    # @question = Question.new(question_params)

    @question = current_user.author_questions.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Your question successfully created.'
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    # @question.update(question_params) if current_user.author_of?(@question)
    may?(@question) ? @question.update(question_params) : no_rights(@question)

    #if current_user.author_of?(@question)
    #  @question.update(question_params)
    #else
    #  redirect_to @question, notice: 'You have no rights to do this.'
    #end
  end

  def destroy
    question.destroy if current_user.author_of?(question)    

    #if current_user.author_of?(question)
    #  question.destroy
    #  redirect_to questions_path, notice: 'Your question was successfully deleted.'
    #else
    #  redirect_to question, notice: 'You have no rights to do this.'
    #end
  end

  private

  def pub_question
    return if @question.errors.any?

    ActionCable.server.broadcast('questions',
      ApplicationController.render(
        partial: 'questions/question_simple',
        locals: { question: @question }
      )      
    )
  end 

  def question_params
    params.require(:question).permit(:title, 
      :body,
      :vote,
      Voted::STRONG_PARAMS,
      files: [],
      links_attributes: [:name, :url, :id, :_destroy],
      reward_attributes: %i[title image]
    )
  end

end
