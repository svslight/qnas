// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

import 'jquery'
import "jquery_ujs"

import "@rails/actioncable"
import "@rails/activestorage" 
import "./channels/"
import "./channels/consumer"
import "./channels/questions"
import "./channels/answers"

import "./custom/answers"
import "./custom/questions"
import "./custom/add_link"
import "./custom/votable"

import "@popperjs/core"
import "bootstrap"
import "@nathanvda/cocoon"

// var App = App || {};
// App.cable = ActionCable.createConsumer();

// (function() {
//   this.App || (this.App = {});
//   App.cable = ActionCable.createConsumer();
// }).call(this);

document.addEventListener("turbo:load", function () {
  // This code is copied from Bootstrap's docs. See link below.
  var tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  );
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
});
