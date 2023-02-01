class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]

  include Voted

  # before_action -> { question.links.build }, only: [:new, :create]
   
  expose :questions, -> { Question.all }
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
    @question.update(question_params) if current_user.author_of?(@question)

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
