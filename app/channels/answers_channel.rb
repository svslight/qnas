class AnswersChannel < ApplicationCable::Channel
  def follow(data)
    stream_from "answers_question_#{data['question_id']}"
  end

  # def follow
  #   question = Question.find(params[:id])
  #   stream_for question
  # end
end
