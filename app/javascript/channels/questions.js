// var App = App || {};

import consumer from "./consumer"

// App.cable = consumer;

// consumer.subscriptions.create({ channel: "ChatChannel", room: "Best Room" })

consumer.subscriptions.create('QuestionsChannel', {
  connected: function() {
    console.log('Question Channel Connected!');
    return this.perform('follow');
  },
  received: function(data) {
    console.log(data);
    return $('.questions').append(data);
  }
});
