var app = angular.module('loginApp', ['ngRoute']);

app.controller('LogInController', function($scope, $http){
	$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	
	console.log('haha');
	$scope.login = function(){
		
		console.log('hahadd');
		console.log($scope.user);
		alert('haha');
		dataLoading = true; //to let the gif run in index.jsp. viewmodel ung vm
		
		$http({
            method : 'POST',
            url : 'LogInServlet',
            //dataType: json,
            contentType: 'application/json',
            data : {'idnumber': JSON.stringify($scope.user.idnumber),
            		'password':JSON.stringify($scope.user.password)}, //make sure that your data is sent as proper JSON:
        }).success(function(data) {
            console.log(data);
            alert('haha');
        }).error(function(data) {
        	dataLoading = false;
            console.log(data);
        });
        console.log("POST done");
    };
	
});
	/*function LoginController($scope, $http) {

		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'javaAngularJS'
			}).success(function(data, status, headers, config) {
				$scope.person = data;
			}).error(function(data, status, headers, config) {
				// called asynchronously if an error occurs
				// or server returns response with an error status.
			});

		};
	};*/