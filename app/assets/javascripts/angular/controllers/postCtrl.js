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

  $scope.getPosts = function(journey){
    $.get('/journeys/' + journey.id + '/posts.json')
      .success(function(response){
      journey.posts = response;
      return journey;
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

  $scope.edit = function(object){
    object.editable = true;
  };

  $scope.updatePost = function(journeyId, post){
    $http({
      method: 'PUT',
      url: '/journeys/' + journeyId + '/posts/' + post.id + '.json',
      data: { post: post }
    }).success(function(response){
      post.editable = false;
    });
  };

  $scope.deletePost = function(journeyId, post){
    post.editable = false;
    $http({
      method: 'DELETE',
      url: '/journeys/' + journeyId + '/posts/' + post.id + '.json',
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

  $scope.updateJourney = function(journey){
    $http({
      method: 'PUT',
      url: '/journeys/'+journey.id+'.json',
      data: { journey: journey }
    });
  };

  $scope.deleteJourney = function(journeyId){
    $http({
      method: 'DELETE',
      url: '/journeys/'+journeyId
    });
  };

  $scope.cancelEdit = function(object){
    object.editable = false;
  };

}]);