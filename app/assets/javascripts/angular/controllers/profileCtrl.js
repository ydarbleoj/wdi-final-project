journeyAppCtrls.controller('ProfileCtrl', ['$scope', 'API', '$routeParams', function($scope, API, $routeParams){

	$scope.profileUser = {};

	API.User.get({ "id": $routeParams.id }, function(response){
		$scope.profileUser = response.user;

		API.UserFollowing.query({ "id": $routeParams.id }, function(response){
			$scope.profileUser.following = response;

		});

		API.UserFollowers.query({ "id": $routeParams.id }, function(response){
			$scope.profileUser.followers = response;
		});
	});

	$scope.followUser = function(user){
		API.UserFollowers.save({'id': user.id});
	};

}]);
