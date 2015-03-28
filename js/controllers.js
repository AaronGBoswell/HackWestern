var GrapeVine = angular.module("GrapeVine", ['ui.bootstrap']);

GrapeVine.controller("eventControl", function($scope, $http, $modal, $log) {
	
	$http.get('jsons/events.json').success(function(data) {
		$scope.events = data.events;
	});

	$scope.open = function(size) {

    var modalInstance = $modal.open({
      templateUrl: 'tpl/new_event.html',
      controller: 'modInstControl',
      size: size,
      resolve: {}
      }

    );
};	
});

GrapeVine.controller('modInstControl', function($scope, $modalInstance) {

  $scope.ok = function () {
    $modalInstance.close();
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});