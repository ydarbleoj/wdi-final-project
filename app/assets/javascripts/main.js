var journeyApp = angular.module('journeyApp', [
	'journeyRouter',
	'angularFileUpload',
	'journeyAppCtrls',
	'ngResource'
	]);

var journeyAppCtrls = angular.module('journeyAppCtrls', []);




journeyRouter = angular.module("journeyRouter", [
	"ngRoute"
]);

journeyRouter.config(['$routeProvider', function($routeProvider){
	$routeProvider
		.when('/', {
			templateUrl: '../templates/index.html',
			controller: 'IndexCtrl'
		})
		.when('/newsfeed', {
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
		.when('/logout', {
			templateUrl: '../templates/index.html',
			controller: 'LoginCtrl'
		})
		.when('/signup', {
			templateUrl: '../templates/signup.html',
			controller: 'LoginCtrl'
		})
		.when('/new-post', {
			templateUrl: '../templates/new_post.html',
			controller: 'PostCtrl'
		})
		.when('/my-journeys', {
			templateUrl: '../templates/my_journeys.html',
			controller: 'PostCtrl'
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'NavCtrl'
		});
}]);

