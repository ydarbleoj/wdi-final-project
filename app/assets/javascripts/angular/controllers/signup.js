journeyAppCtrls.controller("SignupFormCtrl", ['$scope', function($scope){

	$scope.message = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus, id, magnam, suscipit ipsam quidem tempora voluptates corporis illum soluta autem architecto nobis sequi repellat quo doloribus laboriosam unde. Eos, quos.";

	$scope.submitForm = function(isValid) {
		if(isValid) {
			alert('you think you are signed up');
		}
	};
}]);