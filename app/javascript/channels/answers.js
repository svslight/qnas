import consumer from "./consumer"

// Активировать кнопку: Показать Форму Редактирования Ответа

$(document).on('turbo:load', function(){
  $('.question_answers').on('click', '.edit-answer-link', function(e) {
      e.preventDefault();
      $(this).hide();
      var answerId = $(this).data('answerId');
      $('form#edit-answer-' + answerId).removeClass('hidden');
  })

  consumer.subscriptions.create('AnswersChannel', {
    connected: function() {
      console.log('Answer Channel Connected!');
        return this.perform('follow', {question_id: gon.question_id });
    },
    received: function(data) {
      console.log(data);
      console.log('2 Answer Channel Connected!');
      if (data.author != gon.user) {
        return $('ul.question_answers').append(JST["templates/answer"]({
          answer: data.answer,
          files: data.files,
          links: data.links,
          rating: data.rating,
          author: data.answer.author_id
        }));
      }
    }
  });

});
