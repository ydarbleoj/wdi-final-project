var journeyApp = angular.module('journeyApp', [
	'journeyRouter', 
	'journeyAppCtrls'
	// 'navCtrl'
	]);

journeyAppCtrls = angular.module('journeyAppCtrls', []);


journeyRouter = angular.module("journeyRouter", [
	"ngRoute"
]);

journeyRouter.config(['$routeProvider', function($routeProvider){
	$routeProvider
		.when('/home', {
			templateUrl: '../templates/journeys.html', 
			controller: 'newsfeedCtrl'
		})
		.when('/profile', {
			templateUrl: '../templates/profile.html', 
			controller: 'profileCtrl'
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'navCtrl'
		});
}]);


