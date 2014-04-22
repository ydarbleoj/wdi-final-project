var journeyApp = angular.module('journeyApp', [
	'journeyRouter',
	'angularFileUpload',
	'journeyAppCtrls',
	'journeyAppServices',
	'appDirective'
	]);

var journeyAppCtrls = angular.module('journeyAppCtrls', []);

var appDirective = angular.module('appDirective', []);

var journeyAppServices = angular.module('journeyAppServices', ['ngResource']);

//	journeyAppServices.factory('Post', ['$resource', function($resource){
//		return $resource(
//			"/journeys/:journey_id/posts/:id.json",
//			{journey_id: "@journey_id", id: "@id"},
//			{update: {method: "PATCH"}
//		});
//	}]);

//	journeyAppServices.factory('Journey', ['$resource', function($resource){
//		return $resource('/journeys.json', {
//			query: { method: 'GET', isArray: true },
//		});
//	}]);

//	journeyAppServices.factory('User', ['$resource', function($resource){
//		return $resource('/users/:id.json', {
//			query: { method: 'GET', params },
//			update: { method: 'PATCH' }
//		});
//	}]);

journeyAppServices.factory('API', ['$resource', function($resource){
	return {
		Journey: $resource('/journeys/:id.json', {
			query: { method: 'GET', url: '/journeys.json', isArray: true },
			update: { method: 'PUT' }
		}),
		Post: $resource('/journeys/:journey_id/posts/:id', {
			query: {method: 'GET',
							url: '/journeys/:journey_id/posts',
							params: { journey_id: this.id },
							isArray: true
						},
			update: {method: 'PUT'}
		}),
		User: $resource('/users/:id.json', {
			query: { method: 'GET', url: '/users.json', isArray: true },
			update: { method: 'PUT' }
		}),
		CurrentUser: $resource('/current-user.json')
	};
}]);



journeyRouter = angular.module("journeyRouter", ["ngRoute"]);

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
		.when('/users/:id', {
			templateUrl: '../templates/user.html',
			// TODO: build out UserCtrl and change controller here
			controller: 'PostCtrl'
		})
		.when('/my-journeys', {
			templateUrl: '../templates/my_journeys.html',
			controller: 'PostCtrl'
		})
		.when('/picture', {
			templateUrl: '../templates/posts/picture.html',
			controller: ''
		})
		.otherwise({
			templateUrl: '../templates/nav.html',
			controller: 'NavCtrl'
		});
		// $locationProvider.html5Mode(true);
}]);
