var GrapeVine = angular.module("GrapeVine", []);

GrapeVine.controller("eventControl", function($scope, $http) {
	$http.get('events.php').success(function(data) {
		$scope.events = data.events;
	});
	$scope.join = function(ev){
		console.log(ev);
		$http.get('join.php',{userid:"1",projectid:ev.id}).success(function(data){
			console.log(data);
		});
	};
});

GrapeVine.directive('eventCard', function() {
  return {
    templateUrl: 'event_card.html'
  };
});