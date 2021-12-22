/*
 *  Licensed Materials - Property of IBM
 *  5725-I43 (C) Copyright IBM Corp. 2011, 2013. All Rights Reserved.
 *  US Government Users Restricted Rights - Use, duplication or
 *  disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

function getDetails(empNumber) {
   
	pathroot = "HR_Services/resources/employees/";
	pathsuffix = "/details";

	
	var input = {
	    method : 'get',
	    returnedContentType : 'json',
	    path : pathroot + empNumber + pathsuffix,
	    body: {
	    	contentType: 'application/json; charset=UTF-8'
	    }
	};
	
	
	return WL.Server.invokeHttp(input);
}

