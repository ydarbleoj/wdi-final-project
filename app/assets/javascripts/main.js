var journeyApp = angular.module('journeyApp', [
	'journeyRouter', 
	'journeyAppCtrls'
	]);

journeyAppCtrls = angular.module('journeyAppCtrls', []);


journeyRouter = angular.module("journeyRouter", [
	"ngRoute"
]);

journeyRouter.config(['$routeProvider', function($routeProvider){
	$routeProvider
		.when('/home', {
			templateUrl: '../templates/index.html', 
			controller: 'IndexCtrl'
		})
		.when('/contact', {
			templateUrl: '../templates/journeys.html', 
			controller: 'NewsFeedCtrl'
		})
		.when('/profile', {
			templateUrl: '../templates/profile.html', 
			controller: 'ProfileCtrl'
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'NavCtrl'
		});
}]);


