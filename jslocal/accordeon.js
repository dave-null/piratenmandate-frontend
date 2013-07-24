function accordeonInit() {
	var block = false;
	$(".gebiet h2").click(function(){
		if(!block) {
			block = true

			var self = $(this)
			if(!$(this).parent().hasClass("open")) {
				$('.open').removeClass("open");
				$("#accordeon").animate({
					width:'30px'
				}, 450, function() {
					$(this).addClass("accordeonClosed");
					$('#mapInfo').html(self.parent().children('.content').html());
					$("#mapInfo").fadeIn(250, function() {
						block = false;
					});
				});
			} else {
				$("#mapInfo").fadeOut(250, function() {
					$(this).html("");
					$("#accordeon").removeClass("accordeonClosed");
					$("#accordeon").animate({
						width:'100%'
					}, 450, function() {
						block = false;
					});
				});
			}
			$(this).parent().toggleClass("open");
		}
	});
}