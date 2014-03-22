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