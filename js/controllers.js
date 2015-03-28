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

  $scope.openy = function($event) {

    $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;

  };

  $scope.today = function() {
	$scope.dt = new Date();
  };

  $scope.today();

  $scope.toggleMin = function() {
	$scope.minDate = $scope.minDate ? null : new Date();
  };
	
  $scope.toggleMin();

  $scope.dateOptions = {
	formatYear: 'yy',
	startingDay: 1
  };

  $scope.clear = function () {
	$scope.dt = null;
  };

  //For the timepicker
  $scope.mytime = new Date();
  $scope.hstep = 1;
  $scope.mstep = 15;
  $scope.ismeridian = true;

});

GrapeVine.directive('datepickerPopup', function (){
    return {
        restrict: 'EAC',
        require: 'ngModel',
        link: function(scope, element, attr, controller) {
      //remove the default formatter from the input directive to prevent conflict
      controller.$formatters.shift();
  }
}
});
GrapeVine.directive('eventCard', function() {
  return {
    templateUrl: 'tpl/event_card.html'
  };
});