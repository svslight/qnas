// var App = App || {};

import consumer from "./consumer"

// App.cable = consumer;
// consumer.subscriptions.create({ channel: "ChatChannel", room: "Best Room" })

// Активировать кнопку редактирования Вопроса
// Показать Форму Редактирования

$(document).on('turbo:load', function(){
  $('.question_box').on('click', '.edit-question-link', function(e) {
      e.preventDefault();
      $(this).hide();
      var questionId = $(this).data('questionId');
      $('form#edit-question-' + questionId).removeClass('hidden');
  })

  consumer.subscriptions.create('QuestionsChannel', {
    connected: function() {
      console.log('Question Channel Connected!');
      return this.perform('follow');
    },
    received: function(data) {
      console.log(data);
      console.log('2 Question Channel Connected!');
      return $('.questions').append(data);
    }
  });

});
