// Активировать кнопку: Показать Форму Редактирования Ответа

$(document).on('turbo:load', function(){
  $('.question_answers').on('click', '.edit-answer-link', function(e) {
      e.preventDefault();
      $(this).hide();
      var answerId = $(this).data('answerId');
      $('form#edit-answer-' + answerId).removeClass('hidden');
  })	
});
