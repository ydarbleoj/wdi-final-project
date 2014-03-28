 journeyAppCtrls.controller('NavCtrl', ['$scope', '$location', function ($scope, $location) {


    $scope.navClass = function (page) {
        var currentRoute = $location.path().substring(1) || 'home';
        return page === currentRoute ? 'active' : '';
    };  


     //$scope.showPageHero = $location.path() === '/';

}]);