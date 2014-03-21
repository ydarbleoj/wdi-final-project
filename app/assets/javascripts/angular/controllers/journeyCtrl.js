journeyAppCtrls = angular.module('journeyAppCtrls', []);

journeyAppCtrls.controller('journeyCtrl', ['$scope', function($scope){

	$scope.foo = 'bar';



}]);


 
journeyAppCtrls.controller('navCtrl', ['$scope', '$location', function ($scope, $location) {
    $scope.navClass = function (page) {
        var currentRoute = $location.path().substring(1) || 'home';
        return page === currentRoute ? 'active' : '';
    };      
}]);

journeyAppCtrls.controller('profileCtrl', ['$scope', function($scope){

	$scope.profile = "James Franco";

}]);

journeyAppCtrls.controller('newsfeedCtrl', ['$scope', function($scope){

	$scope.journeys = [
		{
			name: 'Joel', 
			title: 'Learning Computer Science'
		}, 
		{
			name: 'Kai', 
			title: "about to do some damage on this scene"
		},
		{
			name: "eliot", 
			title: "longest three months of my life"
		}

	];
}]);