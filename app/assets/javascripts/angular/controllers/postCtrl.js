journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', function($scope, $http){
  $scope.foo = "seball";

  $scope.newPost  = {
    post_type: null,
    title: null,
    text: null,
    photo: null,
    video: null,
    caption: null
  };

  $scope.createPost = function(){
    console.log($scope.newPost);
  };

}]);