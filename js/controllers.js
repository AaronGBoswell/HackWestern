var GrapeVine = angular.module("GrapeVine", []);

GrapeVine.controller("eventControl", function($scope, $http) {
	$http.get('events.php').success(function(data) {
		console.log(data);
		$scope.events = data.events;
	});
});

GrapeVine.directive('eventCard', function() {
  return {
    templateUrl: 'event_card.html'
  };
});