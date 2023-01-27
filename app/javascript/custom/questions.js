// Активировать кнопку редактирования Вопроса
// Показать Форму Редактирования

$(document).on('turbo:load', function(){
  $('.question_box').on('click', '.edit-question-link', function(e) {
      e.preventDefault();
      $(this).hide();
      var questionId = $(this).data('questionId');
      $('form#edit-question-' + questionId).removeClass('hidden');
  })
});
