'use strict';

var angularMojoTodoApp = angular.module('angularMojoTodoApp', ['restangular', 'angularMojoTodoApp.controllers'])
	.config(['RestangularProvider', function (RestangularProvider) {
		RestangularProvider.setBaseUrl('http://localhost:3000');
	}]);