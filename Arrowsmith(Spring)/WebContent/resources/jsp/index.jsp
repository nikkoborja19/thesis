<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container" ng-app="loginApp" ng-controller="LogInController">
	
	<div class="alert alert-danger" role="alert" ng-if="showError">...</div>
    
  	<div class="login-box">
  	<div>${msg }</div>
    <div class="greeting">Animo La Salle!</div>
    <form action="login" method="post" class="form-box" role="form">
    
	    <div class="label-textbox-parent-div">
	    	<div class="label-div"><label for="idnumber">ID Number:</label></div>
	    	<div class="input-div"><input type="text" name="idnumber" id="idnumber" ng-model="user.idnumber" class="input-component" required/><br></div>
		</div>
		
		<div class="label-textbox-parent-div">
	    	<div class="label-div"><label for="password">Password:</label></div>
	    	<div class="input-div"><input type="password" name="password" id="password" ng-model="user.password" class="input-component" required/><br></div>
		</div>
		
	    <div class="space-divider"></div>
	    
	    <div class="remember-me-forgot-password-parent-div">
	      <div class = "remember-me-div"><input type="checkbox" name="rememberme" class="remember-me"><span>Remember me</span></div>
	      <div class = "forgot-password-div"><a href="#" class="forgot-password">Forgot Password?</a></div>
	    </div>
	    
	    <div class="space-divider"></div>
	    
	    <!-- <input type="submit" name="submit" value="Login" class="submit-button" ng-click="login()"> -->
	    <button name="submit" value="Login" class="submit-button" ng-click="login()">Login</button>
	    <img ng-if="dataLoading" src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA==" />
	     
    </form>
  </div>
</div>

<jsp:include page="footer.jsp"/>