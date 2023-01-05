class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]  
  
  expose :questions, ->{ Question.all }
  expose :question
  # expose :answer, -> { Answer.new }

  def create
    # create - сохранение сразу в базу а нужно условное сохранение
		# @question = Question.create(question_params)    
    # @question = Question.new(question_params)

    @exposed_question = current_user.author_questions.new(question_params)

    if question.save
      redirect_to question_path(question), notice: 'Your question successfully created.'
    else
      render :new
    end
  end

  def update
    if question.update(question_params)
      redirect_to question
    else
      render :edit
    end
  end

  def destroy
    if current_user.author_of?(question)
      question.destroy
      redirect_to questions_path, notice: 'Your question was successfully deleted.'
    else
      redirect_to question, notice: 'You have no rights to do this.'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
