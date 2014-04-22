var journeyApp = angular.module('journeyApp', [
	'journeyRouter',
	'angularFileUpload',
	'journeyAppCtrls',
	'ngResource', 
	'appDirective'
	]);

var journeyAppCtrls = angular.module('journeyAppCtrls', []);

var appDirective = angular.module('appDirective', []);



journeyRouter = angular.module("journeyRouter", [
	"ngRoute"
]);

journeyRouter.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
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
		.when('/index-picture', {
			templateUrl: '../templates/index/index_picture.html', 
			controller: 'IndexCtrl'
		})
		.when('/index-video', {
			templateUrl: '../templates/index/index_video.html', 
			controller: 'IndexCtrl'
		})
		.when('/index-follow', {
			templateUrl: '../templates/index/index_follow.html', 
			controller: 'IndexCtrl'
		})
		.when('/index-text', {
			templateUrl: '../templates/index/index_text.html', 
			controller: 'IndexCtrl'
		})
		.when('/my-denovo', {
			templateUrl: '../templates/my_denovo.html', 
			controller: 'PostCtrl'
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'NavCtrl'
		});
		// $locationProvider.html5Mode(true);
}]);

