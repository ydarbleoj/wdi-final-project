
journeyAppCtrls.factory('Post', ['$resource', function($resource){
  return $resource("/journeys/:journey_id/posts/:id.json", {journey_id: "@journey_id", id: "@id"}, {update: {method: "PATCH"}});
}]);

journeyAppCtrls.factory('Journey', ['$resource', function($resource){
  return $resource("/journeys/:id.json", { id: "@id"}, {update: {method: "PATCH"}});
}]);


journeyAppCtrls.controller('PostCtrl', ['$scope', '$http', "Post", "$upload", 
  function($scope, $http, Post, $upload){

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
      // on s
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
      // $('#file_upload').find('input[name=key]').val(retdata.key);
      // $('#file_upload').find('input[name=policy]').val(retdata.policy);
      // $('#file_upload').find('input[name=signature]').val(retdata.signature);

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


  $scope.onFileSelect = function($files){

    $scope.files = $files;
    $scope.upload = [];

    for(var i = 0; i < $files.length; i++) {
      var file = $files[i]; 
      file.progress = parseInt(0);
      (function (file, i) {
        $http.get('/getImage.json').success(function(response){
          $scope.s3Params = response;
          $scope.upload[i] = $upload.upload({
            url: 'https://wdi-final-project.s3.amazonaws.com/', 
            method: 'POST', 
            data: {
              'key': $scope.s3Params.key, 
              'acl': 'public', 
              'Content-Type': file.type, 
              'AWSAccessKeyId': $scope.s3Params.AWSAccessKeyId, 
              'success_action_status': '200',
              'Policy': $scope.s3Params.Policy, 
              'Signature': $scope.s3Params.Signature
            },         
            file: file, 
          }).then(function(reponse){ 
            file.progress = parseInt(100);
            if (response.status === 201){
             console.log('success')
            } else {
              console.log('upload failed');
            }
          }, null, function(event){
            file.progress = parseInt(100.0 * event.loaded / event.total);
          });
        });
      }(file, i));
    } 
  };

}]);


