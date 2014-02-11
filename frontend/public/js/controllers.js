'use strict';

angular.module('angularMojoTodoApp.controllers', [])
	.controller('TodoController', ['$scope', '$http', function($scope, $http) {
		$scope.todos = []; // Declare and initialize to an empty array
		
		$http.get('http://localhost:3000/todos', {
            headers: {'Content-Type': undefined },
            transformRequest: angular.identity
        }).success(function (data) {
			$scope.todos = data;
        }).error(function (response) {
        	console.log('Response: ' + response);
        });	
		
		$scope.addTodo = function(todoTitle) {
			var fd = new FormData();
			fd.append("todoTitle", todoTitle); 
			
			$http.post('http://localhost:3000/todo', fd, {
                headers: {'Content-Type': undefined },
                transformRequest: angular.identity
            }).success(function (data) {
				$scope.todos = data;
            }).error(function (response) {
				console.log('Response: ' + response);
            });
		};
	}]);