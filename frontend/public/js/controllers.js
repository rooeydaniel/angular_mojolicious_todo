'use strict';

angular.module('angularMojoTodoApp.controllers', [])
	.controller('TodoController', ['$scope', '$http', function($scope, $http) {
		$scope.todos = []; // Declare and initialize to an empty array
		
		$http.get('http://localhost:3000/public/todos', {
            headers: {'Content-Type': undefined },
            transformRequest: angular.identity
        }).success(function (data) {
			$scope.todos = data;
        }).error(function (response) {
        	console.log('Response: ' + response);
        });	
		
		$scope.addTodo = function(todo) {
			var fd = new FormData();
			fd.append("todoTitle", todo.title); 
			
			$http.post('http://localhost:3000/public/todo', fd, {
                headers: {'Content-Type': undefined },
                transformRequest: angular.identity
            }).success(function (data) {
				$scope.todos = data;
            }).error(function (response) {
				console.log('Response: ' + response);
            });
		};
		
		$scope.changeCompleted = function(data) {
			var fd = new FormData();
			fd.append("id", data.id);
			fd.append("title", data.title);
			fd.append("completed", data.completed);
			
			$http.put('http://localhost:3000/public/todo', fd, {
                headers: {'Content-Type': undefined },
                transformRequest: angular.identity
            }).success(function (data) {
				$scope.todos = data;
            }).error(function (response) {
				console.log('Response: ' + response);
            });
		};
		
		$scope.showCompleted = 0;
	}]);