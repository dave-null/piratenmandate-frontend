function accordeonInit() {
	$(".gebiet h2").click(function(){
		$("#"+$(this).parent().attr("id")+' .content').slideToggle(250);
		$(this).parent().toggleClass("open");
	});
}