
/* JavaScript content from js/controller/HomeController.js in folder common */
/**
 * Logic for home page
 */
app.controller('HomeController', function($scope, $state, Adapter, busyIndicator) {
	$scope.init = function(){
		$scope.empNo = "";
		$scope.name = "";
		$scope.dob = "";
		$scope.phone = "";
		$scope.salary = "";
		$scope.job = "";
		$scope.hiredate = "";
		$scope.bonus = "";
		$scope.searchErrorMessage = "";
	}	;
		
	$scope.user = {
		username: "",
		password: "",
	};
	
	$scope.search = function(empNo){
		console.log("searching for employee number: "+empNo);
		$scope.init();
		$scope.empNo = empNo;
		
		//trigger loading icon
		busyIndicator.show();
		
		/* To change the adapter, comment/uncomment the following lines of code, using the values as shown:
		 * For the Local adapter (localhost), use "EmployeeAdapter_local".
		 * for the SecureGateway adapter, use "EmployeeAdapter_SecuregGateway".
		 * For the API Connect adapter, use "EmployeeAdapter_APIConnect".
		 */
	/*	Adapter.invokeProcedure("EmployeeAdapter_local","getDetails",[ empNo])          */
		Adapter.invokeProcedure("EmployeeAdapter_SecureGateway","getDetails",[ empNo]) 
	/*	Adapter.invokeProcedure("EmployeeAdapter_APIConnect","getDetails",[ empNo])     */
		
		.then(function (data)	{// success
			console.log("Got data");		
						
			//Test got valid response
			//if not valid stay on page and produce error message
			
			EmployeeError = data.out_text;		
			$scope.searchErrorMessage = EmployeeError;
			$scope.$apply();			
			/* The following two lines are used to retrieve the data returned from the adapter call
			 * to the IIB REST API.
			 * Depending on whether the response message has array elements or not seems to affect the 
			 * requirement to use array processing here, and not always in an obvious way. Sometimes it seems this is 
			 * necessary, and sometimes not. I have not been able to be definitive about whether array 
			 * processing is required here or not, so take care if you change the nature of the IIB REST API
			 * response message.
			 * Fyi, in javascript, array element are addressed by the [] notation, for example [0] indicates
			 * array element 1. 
			 */
			EmployeeResponse = data.Employee;
			DepartmentResponse = data.Department;
			
			/* Now set the values of internal variables for the Employee Application to those returned from IIB */
			/* First the elements from the Employee element  */
			$scope.name = EmployeeResponse.FIRSTNME + " " + EmployeeResponse.LASTNAME;
			$scope.dob = EmployeeResponse.BIRTHDATE;
			$scope.phone = EmployeeResponse.PHONENO;
			$scope.salary = EmployeeResponse.SALARY;
			$scope.job = EmployeeResponse.JOB;
			$scope.hiredate = EmployeeResponse.HIREDATE;
			$scope.bonus = EmployeeResponse.BONUS;
			/* now the bits from the Department element  */
			$scope.deptno = DepartmentResponse.DEPTNO;
			$scope.deptname = DepartmentResponse.DEPTNAME;
			$scope.searchErrorMessage = "";
			
			$state.go("result");	

			busyIndicator.hide();
			
		},	
		
		function(error)	{ //fail
			console.log("Failed to load data",error);
			
			$scope.searchErrorMessage = EmployeeError + "Problem Running Search";
			$scope.$apply();
			busyIndicator.hide();
		});

		
	};
	
	$scope.signIn = function(form) {
		console.log("Sign in with: "+form);
		$scope.user.username = form.username;
		$scope.user.password = form.password;
	    $state.go('search');
	};


});