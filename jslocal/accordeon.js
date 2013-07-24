function accordeonInit() {
	$(".gebiet h2").click(function(){
		//$("#"+$(this).parent().attr("id")+' .content').slideToggle(250);
		$(this).parent().toggleClass("open");

		if(!$("#accordeon").hasClass("accordeonClosed")) {
			$("#accordeon").animate({
				width:'30px'
			}, 450, function() {
				$(this).addClass("accordeonClosed");
				$('#mapInfo').html($("#"+$(this).parent().attr("id")+' .content').html());
				$("#mapInfo").show(250);
			});
		}
	});
}