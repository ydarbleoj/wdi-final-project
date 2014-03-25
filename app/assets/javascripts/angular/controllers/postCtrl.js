journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', function($scope, $http){
  $scope.foo = "seball";

  $scope.newPost  = {};
  $scope.journeys = {};
  $scope.newJourney = {};
  $scope.currentJourney = {};

  // $scope.getCrudUrl = function(method, journey, post){
  //   if (method === 'create' || method === 'read'){
  //     if (post.id){
  //       return '/journeys/' + journey.id + '/posts.json';
  //     } else {
  //       return '/journeys.json';
  //     }
  //   } else if (method === 'update' || method === 'read') {
  //     if (post.id) {
  //       return '/journeys/' + journey.id + '/posts/' + post.id + '.json';
  //     } else {
  //       return '/journeys/' + journey.id + '.json';
  //     }
  //   }
  // };

  // returns JSON object of user's journeys. pass in true to include an empty
  // journey w/ title 'Create a New Journey' - for populating a dropdown list.
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

  // adds journey.posts array to a journey object
  $scope.getPosts = function(journey){
    $.get('/journeys/' + journey.id + '/posts.json')
      .success(function(response){
      journey.posts = response;
      return journey;
    });
  };

  // creates a post given a journey id and an unsaved post object
  $scope.createPost = function(journeyId, post){
    $http({
      method: 'POST',
      url: '/journeys/' + journeyId + '/posts.json',
      data: {
        post: post,
        journey_id: journeyId
      }
    });
  };

  // sets passed in journey or post to edit mode
  $scope.edit = function(object){
    object.editable = true;
  };

  // given journey id and an updated post, persists post changes
  // and takes it out of edit mode
  $scope.updatePost = function(journeyId, post){
    $http({
      method: 'PUT',
      url: '/journeys/' + journeyId + '/posts/' + post.id + '.json',
      data: { post: post }
    }).success(function(response){
      post.editable = false;
    });
  };

  // given a post and its parent journey id, deletes post
  $scope.deletePost = function(journeyId, post){
    post.editable = false;
    $http({
      method: 'DELETE',
      url: '/journeys/' + journeyId + '/posts/' + post.id + '.json',
    });
  };

  // given a new journey & post, saves journey and then saves associated post
  // with new journey id
  $scope.createJourney = function(newJourney, newPost){
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
      $scope.createPost(response.id, newPost);
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