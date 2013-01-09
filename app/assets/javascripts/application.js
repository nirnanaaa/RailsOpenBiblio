//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.9.2.custom.min.js
//= require_tree .
$('.clickable').click(function(){
	window.location = $(this).attr('href');
	return false;
});