journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', function($scope, $http){
  $scope.foo = "seball";

  $scope.newPost  = {};
  $scope.journeys = {};
  $scope.currentJourney = '';

  $scope.getUserJourneys = function(){
    $http({
      method: 'GET',
      url: '/journeys.json'
    }).success(function(response){
      $scope.journeys = response.current_user_journeys;
    });
  };

  $scope.setCurrentJourney = function(journey){
    $scope.currentJourney = journey;
  };

  $scope.createPost = function(journey){
    $http({
      method: 'POST',
      url: '/journeys/' + journey.id + '/posts.json',
      data: {
        post: $scope.newPost,
        journey_id: journey.id
      }
    });
  };

}]);