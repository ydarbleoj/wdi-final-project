
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
  $scope.videoMethod = 'record';
  $scope.currentJourney = {};
  var posts;



  // sets $scope.videoMethod to either 'url' or 'record'
  $scope.setVideoMethod = function(method){
    $scope.videoMethod = method;
  };

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
      posts = response;
      return journey;
    });
  };

  $scope.renderIframes = function(){
    for(var i = 0; i < posts.length; i++){
      var thisplayer = createPlayer(posts[i]);
    }
  };

  // creates a post given a journey id and an unsaved post object
  $scope.createPost = function(journeyId, post){
    // if $scope.videoMethod = 'url', parse for id and save from form
    // if post.post_type !== video, videoId will not have been set,
    // so nil will be passed in, which is the expected behavior
    if ($scope.videoMethod === 'record'){
    post.video = videoId;
  } else if ($scope.videoMethod === 'record'){
    post.video = parseVideoUrl(post.video);
  }

    // TODO: add logic - if video id is nil don't allow create

    $http({
      method: 'POST',
      url: '/journeys/' + journeyId + '/posts.json',
      data: {
        post: post,
        journey_id: journeyId
      }
      // on s
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
      $scope.createPost(response.id);
      // $('#file_upload').find('input[name=key]').val(retdata.key);
      // $('#file_upload').find('input[name=policy]').val(retdata.policy);
      // $('#file_upload').find('input[name=signature]').val(retdata.signature);
    });
  };

  // given a journey with an existing id, updates journey with passed in data
  $scope.updateJourney = function(journey){
    $http({
      method: 'PUT',
      url: '/journeys/'+journey.id+'.json',
      data: { journey: journey }
    });
  };

  // given a journey, deletes it from db
  $scope.deleteJourney = function(journeyId){
    $http({
      method: 'DELETE',
      url: '/journeys/'+journeyId
    });
  };

  // takes the passed in journey or post out of edit mode
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


