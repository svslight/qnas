class AnswersChannel < ApplicationCable::Channel
  def follow(data)
    # question = Question.find(params[:id])
    # stream_for question
    stream_from "answers_question_#{data['question_id']}"
  end
end
