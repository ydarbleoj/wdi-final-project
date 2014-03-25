journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', function($scope, $http){
  $scope.foo = "seball";

  $scope.newPost  = {};
  $scope.journeys = {};
  $scope.newJourney = {};
  $scope.currentJourney = {};

  $scope.getUserJourneys = function(){
    $http({
      method: 'GET',
      url: '/journeys.json'
    }).success(function(response){
      $scope.journeys = response.current_user_journeys;
      $scope.journeys.push({ title: "Create a New Journey" });
    });
  };

  $scope.setCurrentJourney = function(journey){
    $scope.currentJourney = journey;
  };

  $scope.createPost = function(journeyId){
    $http({
      method: 'POST',
      url: '/journeys/' + journeyId + '/posts.json',
      data: {
        post: $scope.newPost,
        journey_id: journeyId
      }
    });
  };

  $scope.createJourney = function(newJourney){
    $http({
      method: 'POST',
      url: '/journeys.json',
      data: {
        journey: {
          title: newJourney.title,
          // start_date: currentJourney.start_date,
          // end_date: currentJourney.end_date
        }
      }
    }).success(function(response){
      $scope.createPost(response.id);
    });
  };

}]);