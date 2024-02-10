// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



import 'select2/dist/css/select2.min.css';
import './select2_init';
import 'bootstrap';
import 'data-confirm-modal';
import $ from 'jquery';
window.$ = window.jQuery = $;
import 'select2';

require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");
require("local-time").start();
require("@hotwired/turbo-rails");
require("@rails/actiontext");
require("trix");

window.Rails = Rails;

$(document).on("turbo:load", () => {
  // console.log("turbo!!")
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});

// import "controllers"
import "controllers";
