$(document).ready(function(){

	var nav = $('.profile-nav-partial').offset(); 
	
	var stickyNav = function(){

		var scrollTop = $(window).scrollTop();

		if( scrollTop > nav ) {
			$('.profile-nav-partial').addClass('fixedTop');
		} else {
			$('.profile-nav-partial').removeClass('fixedTop');
		}
	};

	stickyNav();

	$(window).scroll(function() {
		stickyNav();
	})

});