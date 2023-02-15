import consumer from "./consumer"

$(document).on('turbo:load', function(){
  consumer.subscriptions.create('CommentsChannel', {
    connected: function() {
      console.log('Comment Channel Connected!');
        return this.perform('follow', { question_id: gon.question_id });
    },
    received: function(data) {
      console.log(data);
      console.log('2 Comment Channel Connected!');
      if (data.author != gon.user) {
        let type = data.comment.commentable_type.toLowerCase();
        let resource = type === 'question' ? $('.question-comments') : $('#answer-' + data.comment.commentable_id).find('.answer-comments');
        return resource.append(JST['templates/comment']({
            comment: data.comment
        }));
      }
    }
  });
});
