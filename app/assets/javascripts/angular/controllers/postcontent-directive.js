appDirective = angular.module('appDirective', []);

appDirective.directive('contentItem', ['$compile', '$http', '$templateCache', function($compile, $http, $templateCache) {

		$scope.test = "hello directive";

		var getTemplate = function(contentType) {
			var templateLoader, 
			baseUrl = '../templates/posts', 
			templateMap = {
				text: 'text.html', 
				picture: 'picture.html', 
				video: 'video.html'
			};

			
			var templateUrl = baseUrl + templateMap[contentType];
			templateLoader = $http.get(templateUrl, {cache: $templateCache});

			return templateLoader;
		};

		var linker = function(scope, element, attrs) { 

			var loader = getTemplate(scope.post.post_type); 

			var promise = loader.success(function(html) {
				element.html(html);
			}).then(function(reponse){
				element.replaceWith($compile(element.html())(scope));
			});
		}

		return {
			restrict: 'E', 
			scope: {
				post: '='
			},
			link: linker
		}; 

	}]);









