var app = angular.module('mainApp', ['ngRoute']);

app.config(function($routeProvider){ //routeProvider works together w/ ngRoute. if one is removed, nothing will work
	$routeProvider.when('/', {
		templateUrl : 'page.html' //since angular will put this template in the ng-view we created in the body, dont put the <html><body><title> headers, just put the content mismo :)
	})
	.when('/helloUser', {
		templateUrl : 'hello.html'
	})
	.otherwise({ //acts like a default in switch statements
		redirectTo: '/'
	});
});