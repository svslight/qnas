// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

import 'jquery'
import "jquery_ujs"
//import "popper"
//import "bootstrap"

import "./custom/answers"
import "./custom/questions"
import "./custom/add_link"

import "@popperjs/core"
import "bootstrap"
import "@nathanvda/cocoon"


document.addEventListener("turbo:load", function () {
  // This code is copied from Bootstrap's docs. See link below.
  var tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  );
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
});
