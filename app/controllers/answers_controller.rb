class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create] 
  
  expose :answers, -> { Answer.all }
  expose :answer
  expose :question #, -> { Question.find(params[:question_id]) }

  def create
    @question = Question.find(params[:question_id])
    @answer.author = current_user

    # Для выполнения create.js.erb 
    @answer = @question.answers.create(answer_params)
    @answer.save

    # Для выполнения app/views/answers/_new.html.slim
    # @answer = @question.answers.new(answer_params)

    #respond_to do |format|
    #  if @answer.save
    #    format.html { redirect_to @question, notice: 'Reply successfully sent.' }
    #    format.json { render json: @answer.to_json }
    #  else
        # render 'questions/show'
    #    format.html { render 'questions/show'}
    #    format.json { render json: @answer.errors }
    #  end
    #end
  end

  def update
    @question = answer.question

    if current_user.author_of?(answer)
      answer.update(answer_params)
    else
      redirect_to @question, notice: 'You have no rights to do this.'
    end
  end

  def destroy
    if current_user.author_of?(answer)
      answer.destroy
      redirect_to answer.question, notice: 'Your answer was successfully deleted.'
    else
      redirect_to answer.question, notice: 'You have no rights to do this.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
