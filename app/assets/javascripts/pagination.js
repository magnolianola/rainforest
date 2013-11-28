// jQuery(function(){
// 	$(window).scroll(function () {
// 		if ($(window).scrollTop() > $(document).height() - $(window).height() - 50){
// 			return alert('near bottom');
// 		}
// 	});
// });

// jQuery(function(){
// 	$(window).scroll(function(){
// 		if ($(window).scrollTop() > $(document).height() - $(window).height() - 50){
// 			console.log($('.pagination span.next').eq(-2).children().attr('href'));
// 			$.getScript($('.pagination span.next').eq(-2).children().attr('href'));
// 		}
// 	});
// });

jQuery(function(){
	if ($('.pagination').length){
		$(window).scroll(function(){
			var url;
			url = $('.pagination span.next').eq(-2).children().attr('href');
			if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
				$('.pagination').text("Fetching more products...");
				return $.getScript(url);
			}
		});
	}
});