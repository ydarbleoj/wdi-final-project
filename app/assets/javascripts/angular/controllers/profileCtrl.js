journeyAppCtrls.controller('ProfileCtrl', ['$scope', 'API', '$routeParams', function($scope, API, $routeParams){

	$scope.profileUser = {};

	API.User.get({ "id": $routeParams.id }, function(response){
		$scope.profileUser = response.user;
	});


}]);
