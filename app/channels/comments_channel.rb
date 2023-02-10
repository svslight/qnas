class CommentsChannel < ApplicationCable::Channel
  # def follow
  #   question = Question.find(params[:id])
  #   stream_from "comments:#{question.id}"
  # end
  # def follow(data)
  #   stream_from "comments_question_#{data['question_id']}"
  # end
end
