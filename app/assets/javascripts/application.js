// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap

$(document).ready(function(){
  $('#images-count').change(function(){
    var limit = 10 - $('#images-count').data('images-count')
      var files = $(this)[0].files;
        if(files.length > limit){
            alert("You can select max " + limit + " images.");
            $('#images-count').val('');
            return false;
        }else{
            return true;
        }
    });
});
