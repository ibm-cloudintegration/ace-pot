/*
 *  Licensed Materials - Property of IBM
 *  5725-I43 (C) Copyright IBM Corp. 2011, 2013. All Rights Reserved.
 *  US Government Users Restricted Rights - Use, duplication or
 *  disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

function getDetails(empNumber) {
    	
	/* Because API Connect adds an additional part to the URL path, this needs to be manually added
	 * here (because MobileFirst does not permit this to be provided through the config panel options).
	 * For this scenario, using the BetaWorks login details for Bluemix API Connect, this string is 
	 * "betaworks-dev/sb". Other Bluemix and API Connect systems will be different, so this code 
	 * will have to be changed accordingly.
	 * The remainder of the path is the same one that is used in all of the adapters that invokes
     * HR_Service on IIB.
	 */
  	
    pathroot = "betaworks-dev/sb/HR_Services/resources/employees/";
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

