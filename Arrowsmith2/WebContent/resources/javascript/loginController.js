var app = angular.module('loginApp', ['ngRoute']);

app.controller('LogInController', function($scope, $http){
	$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	console.log("hehe");
	$scope.login = function(){
		console.log($scope.user);
		$scope.dataLoading = true; //to let the gif run in index.jsp. viewmodel ung vm
		
		alert($scope.user.idnumber+""+$scope.user.password);
		$http({
            method : 'POST',
            url : 'submitUserCredentials',
            //dataType: json,
            contentType: 'application/json',
            data : {'idnumber': JSON.stringify($scope.user.idnumber),
            		'password': JSON.stringify($scope.user.password)}, //make sure that your data is sent as proper JSON:
        }).success(function(response) {
        	$scope.dataLoading = true;
            console.log(response);
            $scope.msg = "hello";
            //alert(response);
        }).error(function(response) {
        	$scope.dataLoading = true;
            //console.log(JSON.stringify(response));
        });
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