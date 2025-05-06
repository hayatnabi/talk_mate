// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "semantic-ui"
import "semantic-ui-css/components/transition.js"; // Ensure the transition module is imported

$(function() {
    $('.ui.dropdown').dropdown();
    $(document).on('click', '.message .close', function() {
        $(this).closest('.message').transition('fade');
    });
}); 

$(document).on('turbo:load', function() {
    $('.ui.dropdown').dropdown();
    $('.ui.modal').modal();

    // Ensure the close button works for flash messages
    $(document).on('click', '.message .close', function() {
        $(this).closest('.message').transition('fade');
    });
});
import "channels"
