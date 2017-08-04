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
//= require jquery
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

function errorimg_swap() {
    document.getElementById('livestream').src = "http://90.179.18.233:999"
    document.getElementById('livestream').alt = "http://90.179.18.233:999"
}

$(function(){
   var a = $("#toggledown").on('click',function () {

       if ($("#toggledown span").attr("data-arow") == "down"){

           $("#toggledown span").attr("class", "glyphicon glyphicon-arrow-up");
           $("#toggledown span").attr("data-arow", "up");

       }
       else {
           $("#toggledown span").attr("class", "glyphicon glyphicon-arrow-down");
           $("#toggledown span").attr("data-arow", "down");
       }







    });




});