$(document).on('turbo:load', function(){
  $('.votable ').on('ajax:success', function(e){
    console.log(e.detail);
    let json = e.detail[0];
    $(this).find('.rating span').html(json.rating);
  })
});
