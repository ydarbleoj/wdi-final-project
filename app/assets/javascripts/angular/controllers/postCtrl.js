journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', function($scope, $http){
  $scope.foo = "seball";

  $scope.newPost  = {};
  $scope.journeys = {};
  $scope.newJourney = {};
  $scope.currentJourney = {};

  $scope.getUserJourneys = function(addNew){
    $http({
      method: 'GET',
      url: '/journeys.json'
    }).success(function(response){
      $scope.journeys = response.current_user_journeys;
      if(addNew) {
        $scope.journeys.push({ title: "Create a New Journey" });
      }
    });
  };

  // $scope.setCurrentJourney = function(journey){
  //   $scope.currentJourney = journey;
  //   $scope.getPosts(journey.id, $scope.currentJourney);
  // };

  $scope.getPosts = function(journey){
    $http({
      method: 'GET',
      url: '/journeys/' + journey.id + '/posts.json'
    }).success(function(response){
      journey.posts = response;
    });
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
          start_date: newJourney.start_date,
          end_date: newJourney.end_date
        }
      }
    }).success(function(response){
      $scope.createPost(response.id);
    });
  };

}]);