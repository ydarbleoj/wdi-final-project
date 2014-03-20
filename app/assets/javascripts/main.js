var journeyApp = angular.module('journeyApp', [
	'journeyRouter', 
	'journeyAppCtrls'
	]);


journeyRouter = angular.module("journeyRouter", [
	"ngRoute"
]);

journeyRouter.config(['$routeProvider', function($routeProvider){
	$routeProvider.
		otherwise({
			templateUrl: '../templates/index.html',
			controller: 'journeyCtrl'
		});
}]);
