journeyAppCtrls.controller('NavCtrl', ['$scope', '$location', function ($scope, $location) {

  $scope.navClass = function (page) {
      var currentRoute = $location.path().substring(1) || 'home';
      return page === currentRoute ? 'active' : '';
  };

}]);


journeyAppCtrls.controller('ProfileNavCtrl', ['$scope', '$location', function ($scope, $location) {

	$scope.navClass = function(page) {
		var currentRoute = $location.path().substring(1) || 'home';
		return page === currentRoute ? 'active' : '';
	};

  API.CurrentUser.query(function(response){
    $scope.currentUser = response[0];
  });

}]);
