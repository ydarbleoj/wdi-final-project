journeyAppCtrls.controller('IndexCtrl', ['$scope', function($scope){

	$scope.foo = 'bar';
	var nav;

		$scope.showVideo = function() {
			if ($scope.video) {
				$scope.video = false;
			} else {
				$scope.video = true;
			}
			 //$scope.showPhoto();
		};

		$scope.showPhoto = function(){
			if($scope.photo){
				$scope.photo = false;
			} else {
				$scope.photo = true;
			}
			// $scope.showVideo();
		}

}]);
