'use strict';

angular.module('angularMojoTodoApp.controllers', [])
	.controller('TodoController', ['$scope', '$http', function($scope, $http) {
		$scope.todos = []; // Declare and initialize to an empty array	
		
		$http.get('/public/json/todos.json')
		    .success(function(todos) {
		      $scope.loaded = true;
		      $scope.todos = todos;
		    }).error(function(err) {
		      console.log('Error: ' + err);
		    });
		
	}]);