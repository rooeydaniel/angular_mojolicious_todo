'use strict';

angular.module('angularMojoTodoApp.controllers', [])
	.controller('TodoController', ['$scope', '$http', 'Restangular', function($scope, $http, Restangular) {
		$scope.todos = []; // Declare and initialize to an empty array	
		
		Restangular.all('todos').customGET()
            .then(function (data) {
				console.log("Todos: " + JSON.stringify(data));
                $scope.todos = data;
            }), function (response) {
            	console.log("Error retrieving todos: " + response);
        	};
	}]);