class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]  
  
  expose :questions, ->{ Question.all }
  expose :question

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
    params.require(:question).permit(:title, :body)
  end
end
