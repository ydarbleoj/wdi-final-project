journeyAppCtrls.controller('NavCtrl', ['$scope', '$location','API', function ($scope, $location, API) {

  $scope.navClass = function (page) {
      var currentRoute = $location.path().substring(1) || 'home';
      return page === currentRoute ? 'active' : '';
  };

}]);


journeyAppCtrls.controller('ProfileNavCtrl', ['$scope', '$location', 'API', function ($scope, $location, API) {

	$scope.navClass = function(page) {
		var currentRoute = $location.path().substring(1) || 'home';
		return page === currentRoute ? 'active' : '';
	};

  API.CurrentUser.query(function(response){
    $scope.currentUser = response[0];
  });

}]);
