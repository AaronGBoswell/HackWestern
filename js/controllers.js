var GrapeVine = angular.module("GrapeVine", []);

GrapeVine.controller("eventControl", function($scope, $http) {
	$http.get('jsons/events.json').success(function(data) {
		$scope.events = data.events;
	});
});

GrapeVine.directive('eventCard', function() {
  return {
    templateUrl: 'event_card.html'
  };
});