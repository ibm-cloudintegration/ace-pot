var http = require('http');
require("./EmployeeService");            // imported interface to IB service
fs = require('fs');

formValues = function(data){
    var splits = data.split('&');
    var hash = [];

    for (i = 0; i < splits.length; i++)
    {
        var iSplit = splits[i].split('=');
        hash[iSplit[0]] = iSplit[1];
    }
    return hash;
}
					
http.createServer(function (request, response) 
		{		
					 page1 = '<!DOCTYPE html>' +
								'<head>' +
								'<title >IIB V10 2015 Workshop</title>' +
								'<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" media="screen">' +
								'<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>' +
								'<meta name="viewport" content="width=device-width, initial-scale=1.0">' +
								'</head>' +

								'<body class="container-fluid" ng-controller="employeeController as employeedata">' + 
								'<div class="container">' +
								'<h1 class="masthead">BetaWorks IBM Integration Bus JavaScript API demo</h1>' +

								'<div class="jumbotron">' +
								'<p>Employee Number : </p>' +
								'<form method="post" >' +
								'<input style="width: 300px; margin: 0 auto;" class="form-control" ng-model="empNo" required="" autofocus="" placeholder="enter employee number" name="empNo">' +
								'<p></p>' +
								'<p><i>Invoke the Integration service to receive employee data:</i></p>' +
								'<p><button class="btn btn-lg btn-primary" type="submit" method="POST">Get Employee Data</button></p>' +
			'</form>' +		
		'</div>' +

		'<div class="jumbotron" class="list-group-item">' +
			'<p text="center">Employee Data</p>' +
				'<table class="center" class="list-group-item" class="table"><b>' +
				 '<style>' +
					'table, th , td {' +
					'table-layout: fixed;' +
					'border: 2px solid grey;' +
					'border-collapse: collapse bold;' +
					'padding: 5px;' +
					'}' +
					'table tr:nth-child(odd) {' +
					'table-layout: fixed;' +
					'background-color: #f1f1f1;' +
					'}' +
					'table tr:nth-child(even) {' +
					'table-layout: fixed;' +
					'background-color: #ffffff;' +
					'}' +
					'table.center {' +
					'width:80%;' +
					'margin-left:10%;' + 
					'margin-right:10%;' +
					'height: auto;' +
					'}' +
					'div {' +
					'background-color: #9999FF;' +
					'font-style: bold;' +
					'text-align: center;' +
					'padding-left: 2%; ' +
					'padding-right: 2%;' +
					'}' +
					'.masthead img{' +
					'width:20%;' +
					'height:9%;' +
					'align: left;' +
					'}' +
					'.jumbotron {' +
					'margin-bottom: 10px;' +
					'padding: 5px;' +
					'}' +
				'</style>' +
					'<tr>' +
						'<td>Employee Number : </td>' +
						'<td>      </td></tr>' +
					'<tr>' +
						'<td>First Name      : </td>' +
						'<td> </td>' +
					'<tr>' +	
						'<td>Middle Initial  : </td>' +
						'<td> </td>' +
					'<tr>' +	
						'<td>Last Name       : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Work Department : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Phone Number    : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Hire Date       : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Job             : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Education Level : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Sex             : </td>' +
						'<td> </td>' +
					'<tr>	' +
						'<td>Birthdate       : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Salary          : </td>' +
						'<td> </td>' +
					'<tr>'	 +
						'<td>Bonus           : </td>' +
						'<td> </td>' +
					'<tr>' +	
						'<td>Commission      : </td>' +
						'<td> </td>	' +																							
					'</tr>' +
				'</b>' +
				'</table>' +
		'</div>' +
		'</div>' +
	'</body>	';

							getEmployeeResponse = 
							{
							  "EmployeeResponse" : 
							  {
							
							  "DBResp" : 
								{

								  "UserReturnCode" : 1 , 
								  "RowsAdded" : 1 , 
								  "RowsUpdated" : 1 , 
								  "RowsRetrieved" : 1 ,								  
								  "RowsDeleted" : 1 , 
								  "SQLCode_ErrorCode" : 1 , 
								  "SQLState_SQLState" : "SQLState_SQLStateValue" , 
								  "SQL_Error_Message" : "SQL_Error_MessageValue"

								} , 
								"EMPLOYEE" : 
								{

								  "EMPNO" : "EMPNOValue" , 
								  "FIRSTNME" : "FIRSTNMEValue" , 
								  "MIDINIT" : "MIDINITValue" , 
								  "LASTNAME" : "LASTNAMEValue" , 
								  "WORKDEPT" : "WORKDEPTValue" , 
								  "PHONENO" : "PHONENOValue" , 
								  "HIREDATE" : "2013-04-20" , 
								  "JOB" : "JOBValue" , 
								  "EDLEVEL" : 1 , 
								  "SEX" : "SEXValue" , 
								  "BIRTHDATE" : "2013-04-20" , 
								  "SALARY" : 1.0 , 
								  "BONUS" : 1.0 , 
								  "COMM" : 1.0

								}

							  }
							  
							};
 
					body = "";		
		
					request.on('data', function (chunk)
					{
					body += chunk;
					});

					request.on('end', function () 
					{
					console.log('POSTed: ' + body);
 
						if (body != "")
						{						
						hash = formValues(body);
						console.log("Employee number = " + hash["empNo"]);
					
						empNo = hash["empNo"];

						getEmployeeVar = 
						{
						  "EMPLOYEE" : 
						  {
							"EMPNO" : empNo , 
							"FIRSTNME" : "FIRSTNME" , 
							"MIDINIT" : "D" , 
							"LASTNAME" : "LASTNAME" , 
							"WORKDEPT" : "BTW" ,
							"PHONENO" : "1212" ,	
							"HIREDATE" : "2013-04-20" , 
							"JOB" : "JOB" , 
							"EDLEVEL" : 1 , 
							"SEX" : "M" , 
							"BIRTHDATE" : "2013-04-20" , 
							"SALARY" : 1.0 , 
							"BONUS" : 1.0 , 
							"COMM" : 1.0
						  }
						};
 
					IBMIntegration.EmployeeService.getEmployee( getEmployeeVar, function(err, getEmployeeResponse )
						{
							if (err) 
							{
							console.log(" Failure for IBMIntegration.EmployeeService.getEmployee() ");
							var errName = err.errName;

								if ( errName == "Exception") 
								{
								console.log("Unexpected error occurred.");

//								To retrieve only the exception, navigate to the 2nd last property within err
								var keys = Object.keys(err);
								console.log("Exception type : " + keys[keys.length-2]);
								}
							}
							
						 employeeNumber = getEmployeeResponse.EmployeeResponse.EMPLOYEE.EMPNO;
						 firstName = getEmployeeResponse.EmployeeResponse.EMPLOYEE.FIRSTNME;
						 middleInitial = getEmployeeResponse.EmployeeResponse.EMPLOYEE.MIDINIT;
						 lastName = getEmployeeResponse.EmployeeResponse.EMPLOYEE.LASTNAME;
						 workDept = getEmployeeResponse.EmployeeResponse.EMPLOYEE.WORKDEPT;
						 phoneNo = getEmployeeResponse.EmployeeResponse.EMPLOYEE.PHONENO;
						 hireDate = getEmployeeResponse.EmployeeResponse.EMPLOYEE.HIREDATE;
						 job = getEmployeeResponse.EmployeeResponse.EMPLOYEE.JOB;
						 educationLevel = getEmployeeResponse.EmployeeResponse.EMPLOYEE.EDLEVEL;
						 sex = getEmployeeResponse.EmployeeResponse.EMPLOYEE.SEX;
						 birthDate = getEmployeeResponse.EmployeeResponse.EMPLOYEE.BIRTHDATE;
						 salary = getEmployeeResponse.EmployeeResponse.EMPLOYEE.SALARY;
						 bonus = getEmployeeResponse.EmployeeResponse.EMPLOYEE.BONUS;
						 commission = getEmployeeResponse.EmployeeResponse.EMPLOYEE.COMM;	

						page2 = '<!DOCTYPE html>' +
								'<head>' +
								'<title >IIB V10 2015 Workshop</title>' +
								'<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" media="screen">' +
								'<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>' +
								'<meta name="viewport" content="width=device-width, initial-scale=1.0">' +
								'</head>' +

								'<body class="container-fluid" ng-controller="employeeController as employeedata">' + 
								'<div class="container">' +
								'<h1 class="masthead">BetaWorks IBM Integration Bus JavaScript API demo</h1>' +

								'<div class="jumbotron">' +
								'<p>Employee Number : </p>' +
								'<form method="post" >' +
								'<input style="width: 300px; margin: 0 auto;" class="form-control" ng-model="empNo" required="" autofocus="" placeholder="enter employee number" name="empNo">' +
								'<p></p>' +
								'<p><i>Invoke the Integration service to receive employee data:</i></p>' +
								'<p><button class="btn btn-lg btn-primary" type="submit" method="POST">Get Employee Data</button></p>' +
			'</form>' +		
		'</div>' +

		'<div class="jumbotron" class="list-group-item">' +
			'<p text="center"><b>Employee Data</b></p>' +
				'<table class="center" class="list-group-item" class="table"><b>' +
				 '<style>' +
					'table, th , td {' +
					'table-layout: fixed;' +
					'border: 2px solid grey;' +
					'border-collapse: collapse bold;' +
					'padding: 5px;' +
					'}' +
					'table tr:nth-child(odd) {' +
					'table-layout: fixed;' +
					'background-color: #f1f1f1;' +
					'}' +
					'table tr:nth-child(even) {' +
					'table-layout: fixed;' +
					'background-color: #ffffff;' +
					'}' +
					'table.center {' +
					'width:80%;' +
					'margin-left:10%;' + 
					'margin-right:10%;' +
					'height: auto;' +
					'}' +
					'div {' +
					'background-color: #9999FF;' +
					'font-style: bold;' +
					'text-align: center;' +
					'padding-left: 2%; ' +
					'padding-right: 2%;' +
					'}' +
					'.masthead img{' +
					'width:20%;' +
					'height:10%;' +
					'align: left;' +
					'}' +
					'.jumbotron {' +
					'margin-bottom: 10px;' +
					'padding: 5px;' +
					'}' +
				'</style>' +
					'<tr>' +
						'<td>Employee Number : </td>' +
						'<td><b>' + employeeNumber + '</b></td></tr>' +
					'<tr>' +
						'<td>First Name      : </td>' +
						'<td>' + firstName + '</td>' +
					'<tr>' +	
						'<td>Middle Initial  : </td>' +
						'<td>' + middleInitial + '</td>' +
					'<tr>' +	
						'<td>Last Name       : </td>' +
						'<td>' + lastName + '</td>' +
					'<tr>'	 +
						'<td>Work Department : </td>' +
						'<td>' + workDept + '</td>' +
					'<tr>'	 +
						'<td>Phone Number    : </td>' +
						'<td>' + phoneNo + '</td>' +
					'<tr>'	 +
						'<td>Hire Date       : </td>' +
						'<td>' + hireDate + '</td>' +
					'<tr>'	 +
						'<td>Job             : </td>' +
						'<td>' + job + '</td>' +
					'<tr>'	 +
						'<td>Education Level : </td>' +
						'<td>' + educationLevel + '</td>' +
					'<tr>'	 +
						'<td>Sex             : </td>' +
						'<td>' + sex + '</td>' +
					'<tr>	' +
						'<td>Birthdate       : </td>' +
						'<td>' + birthDate + '</td>' +
					'<tr>'	 +
						'<td>Salary          : </td>' +
						'<td>' + salary + '</td>' +
					'<tr>'	 +
						'<td>Bonus           : </td>' +
						'<td>' + bonus + '</td>' +
					'<tr>' +	
						'<td>Commission      : </td>' +
						'<td>' + commission + '</td>	' +																							
					'</tr>' +
				'</b>' +
				'</table>' +
		'</div>' +
		'</div>' +
	'</body>	';							
							
						console.log(' Success for IBMIntegration.EmployeeService.getEmployee() ');	  
						console.log(" callback invoked: EmployeeService.getEmployee()");
						console.log(getEmployeeResponse);
		
						response.writeHead(200);
						response.write(page2);
						response.end();
						return; 
						});   
					}
			else {
					response.writeHead(200);
					response.end(page1);
					return;
				 }
				});				
}).listen(8000);

console.log('Server running at http://127.0.0.1:8000/');