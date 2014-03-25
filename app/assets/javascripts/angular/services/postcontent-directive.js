journeyDirectives.directive('contentItem', function($compile){
		
		// $compile compiles an HTML string of DOM into a template and 
		// produces a template function, which can be used to link scope with template
		var imageTemplate = '<div class="entry-photo"><h2>&nbsp;</h2><div class="entry-img"><span><a href="{{rootDirectory}}{{content.data}}"><img ng-src="{{rootDirectory}}{{content.data}}" alt="entry photo"></a></span></div><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.description}}</div></div></div>';
	  var videoTemplate = '<div class="entry-video"><h2>&nbsp;</h2><div class="entry-vid"><iframe ng-src="{{content.data}}" width="280" height="200" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.description}}</div></div></div>';
	  var noteTemplate = '<div class="entry-note"><h2>&nbsp;</h2><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.data}}</div></div></div>';
		

		// basic function to return correct template based on type 
	  var getTemplate = function(contentType) {
	  	var template = '';

	  	switch(contentType) {
	  		case 'image': 
	  			template = imageTemplate;
	  			break;
				case 'video':
					template: videoTemplate;
					break;
				case 'note':
					template = noteTemplate;
					break;
	  	}
	  	return template;
	  }

		// in this element I'm isolating the scope bound to the content property
		// linker function 
		var linker = function(scope, element, attrs) {
			scope.rootDirectory = 'images/';

			element.html(getTemplate(scope.content.content_type)).show();

			$compile(element.content())(scope);

		}
		return {
			restrict: "E", 
			replace: true, 
			link: linker, 
			scope: {
				content: '='
			}
		};


	});