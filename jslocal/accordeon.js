function accordeonInit() {
	$(".gebiet h2").click(function(){
		//$("#"+$(this).parent().attr("id")+' .content').slideToggle(250);
		var self = $(this)
		if(!$(this).parent().hasClass("open")) {
			$('.open').removeClass("open");
			$("#accordeon").animate({
				width:'30px'
			}, 450, function() {
				$(this).addClass("accordeonClosed");
				$('#mapInfo').html(self.parent().children('.content').html());
				$("#mapInfo").fadeIn(250);
			});
		} else {
			$("#mapInfo").fadeOut(250, function() {
				$(this).html("");
				$("#accordeon").removeClass("accordeonClosed");
				$("#accordeon").animate({
					width:'100%'
				}, 450);
			});
		}
		$(this).parent().toggleClass("open");
	});
}