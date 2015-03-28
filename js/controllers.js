var GrapeVine = angular.module("GrapeVine", ['ui.bootstrap']);

GrapeVine.controller("eventControl", function($scope, $http, $modal) {
	
	$http.get('php/events.php').success(function(data) {
		$scope.events = data.events;
	});

	$scope.join = function(ev){
		console.log(ev);
		$http.get("php/join.php?userid=1&eventid="+ev.id).success(function(data){
			console.log(data);
		});
	};

	$scope.open = function(size) {

	    var modalInstance = $modal.open({
	      templateUrl: 'tpl/new_event.html',
	      controller: 'modInstControl',
	      size: size,
	      resolve: {}
	    });

	}

	$scope.sets = function(size) {

		var modalInstance = $modal.open({
			templateUrl: 'tpl/settings.html',
			controller: 'setsControl',
			size: size,
			resolve: {}
		});

	}

	$scope.joined = function(ev) {

		var result = "", eLength = ev.joined.length, i;

		for (i=0;i<eLength;i++) {
			var holder = ev.joined[i].fName + " " + ev.joined[i].lName + "\n";
			result = result.concat(holder);
		}

		return result;
	}
});

GrapeVine.controller('setsControl', function($scope, $modalInstance) {

	$scope.good = function () {
		$modalInstance.close();
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

GrapeVine.directive('eventCard', function() {
  return {
    templateUrl: 'tpl/event_card.html'
  };
});