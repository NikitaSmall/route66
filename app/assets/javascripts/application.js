// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var string = "";
var first = 1;
$(document).ready(function(){
    $(document).keyup(function(e){
        string+= e.which.toString();

        if((string.indexOf('38384040373937396566') + 1) && first == 1) {
            $('body').append("<div id='easter-2' style='position: fixed; right: 50%; bottom: 105%;'>Фин! Сражайся честно, несносный мальчишка!</div>");
            $('#easter').animate({bottom:'0px'}, {duration:600});
            $('#easter-2').animate({bottom:'-50px'}, {duration:5000});
            $('#easter').animate({bottom:'-10px'}, {duration:300});
            $('#easter').animate({bottom:'0px'}, {duration:300});
            $('#easter').animate({bottom:'-15px'}, {duration:300});
            $('#easter').animate({bottom:'-5px'}, {duration:300});
            $('#easter').animate({bottom:'-10px'}, {duration:300});
            $('#easter').animate({bottom:'0px'}, {duration:300});
            $('#easter').animate({bottom:'-10px'}, {duration:300});
            $('#easter').animate({bottom:'0px'}, {duration:300});
            $('#easter').animate({bottom:'-30px'}, {duration:300});
            $('#easter').animate({bottom:'-250px'}, {duration:500});
            first = 0;
        }
    });
});