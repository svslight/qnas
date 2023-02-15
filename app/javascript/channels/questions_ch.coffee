import consumer from "./consumer"

$(document).on 'turbo:load', ->
  questions = $("ul.questions")

  if questions.length
    consumer.subscriptions.create('QuestionsChannel', {
      connected: ->
        @perform 'follow',
      received: (data) ->
        questions.prepend data
    })
