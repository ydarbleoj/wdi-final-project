var journeyApp = angular.module('journeyApp', [
	'journeyRouter',
	'journeyAppCtrls'
	]);

var journeyAppCtrls = angular.module('journeyAppCtrls', []);




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
		.when('/login', {
			templateUrl: '../templates/login.html',
			controller: 'LoginCtrl'
		})
		.when('/signup', {
			templateUrl: '../templates/signup.html',
			controller: 'LoginCtrl'
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'NavCtrl'
		});
}]);


