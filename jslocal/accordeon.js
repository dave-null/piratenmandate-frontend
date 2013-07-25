var abstractID = "#abstract h2";

function abstractCtl(s) {
	if (s==0) {
			$(abstractID).parent().children("p").slideUp();
			$(abstractID).addClass("closed"); }
	else if (s==1) {
			$(abstractID).parent().children("p").slideDown();
			$(abstractID).removeClass("closed"); }
	else if (s==2) {
			$(abstractID).parent().children("p").slideToggle();
			$(abstractID).toggleClass("closed"); }
}

function accordeonInit() {
	$(abstractID).click(function(){abstractCtl(2);});

	$('#accordeon h2').hover(
		function(){
			if ($('#accordeon').hasClass('accordeonClosed') && !$(this).parent().hasClass('open')) {
				$(this).children('.leaflet-label').fadeIn('fast');}}
		,function(){
			$(this).children('.leaflet-label').fadeOut('fast');})

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