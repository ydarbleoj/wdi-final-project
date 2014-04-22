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


$(document).ready(function(){
	console.log('begin');
	var followText = [
		"Follow Those Who Inspire", 
		"Will Follow Your Lead", 
		"Can See How Others Experience Transformation"
	]

	function RandomText() {
		var ranText = Math.floor(Math.random() * followText.length);

		$('#random-follow'),fadeOut('fast', function(){
			$(this).text(followText[ranText]).fadeIn('fast');
		});
	}
	$(function() {
		RandomText();
	});
	var interval = setInterval(function() { RandomText();}, 3000); 

});