journeyAppCtrls.controller("PostContentCtrl", ["$scope", "$http",  function($scope, $http){
	
	$scope.user = {
        name: "Joel", 	
  };
 	
  $scope.journeys = [
  	{ title: "Transition" }, 
  	{ title: "Marathon" }, 
  	{ title: {
  		other: "default"
  		} 
  	}
  ];

  // $scope.data = {
  // 	newJourney: "default", 
  // 	newPost: "default"
  // }

  $scope.post_options =
    [
        { id: 1, type: "Video" },
        { id: 2, type: "Picture" },
        { id: 3, type: "Text" }

    ];

	$scope.content = dataVids;
	// $scope.content = [];

	// $scope.fetchContent = function() {
	// 	$http.get($scope.url).then(function(result){
	// 		$scope.content = result.data;
	// 	});
	// }
	// populating content with data

	// $scope.fetchContent();

}]);