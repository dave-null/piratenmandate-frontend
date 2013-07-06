$(document).ready(function(){
	$(".nav-tile").click(function(){
		$("#"+$(this).attr("id")+"-content").slideToggle(250);	
		$(this).toggleClass("title-open");
	});
});