var GrapeVine = angular.module('GrapeVine', []);

GrapeVine.controller('eventControl', function($scope) {
	$scope.events = [
		{'name': 'Hackathon'},
		{'name': 'Marathon'},
		{'name': 'Code Session'}
	];
});