var fs = require('fs');

/* Create the IBMIntegration namespace */
if (typeof IBMIntegration === "undefined")
{
  IBMIntegration = {};
  IBMIntegration.ClientEnvironment = {};
  IBMIntegration.ClientEnvironment.ProtocolVersion = 1.0;
  IBMIntegration.ClientEnvironment.GenerationDate = "12/06/14 10:24";

  if (typeof module !== 'undefined' && this.module !== module) {
    //We are in nodejs
    try
    {
      var dojoModule = require.resolve("dojo/dojo");
          
      var dojoLocation = dojoModule.replace(/\\/g, "/");
      dojoLocation = dojoLocation.substring(dojoLocation.indexOf("/"), dojoLocation.lastIndexOf("/dojo/dojo.js"));
    
      dojoConfig = {async: true, baseUrl: dojoLocation, packages: [{name: "dojo", location: "dojo"}]};
    
      require("dojo/dojo");
      IBMIntegration.ClientEnvironment.Platform = "nodejs";
    }
    catch(e)
    {
      console.log(e);
      console.log("Unable to locate dojo.js. Ensure the dojo module has been installed using npm");
    }
  } else {
      //We are in a browser
      IBMIntegration.ClientEnvironment.Platform = navigator.userAgent;
  }  
}

var SimpleError = function(errName, value) {
  this.errName = errName;
  this.value = value;
}

var ComplexError = function(errName, values) {
  this.errName = errName;
  var keys = Object.keys(values);
  for (var i=0; i<keys.length; i++) {
    this[keys[i]] = values[keys[i]];
  }
}

IBMIntegration.EmployeeService = {};
IBMIntegration.EmployeeService.IBMContext = {};
// default values that can be overridden in the client code
IBMIntegration.EmployeeService.IBMContext.hostname = "localhost";
IBMIntegration.EmployeeService.IBMContext.port     = 7800;
IBMIntegration.EmployeeService.IBMContext.protocol = "http";
IBMIntegration.EmployeeService.IBMContext.rejectUnauthorized = true;

IBMIntegration.EmployeeService.getEmployee = {};


IBMIntegration.EmployeeService.EmployeeServiceInner = function(myRequest, destHost, destPort, operation, postData, callback)
{
  var myURL = "";
  if ((typeof destHost === "undefined") || 
      (typeof destPort === "undefined") ||
      (destHost == "" ) ||
      (destPort == "" ))
  {
     myURL = "/EmployeeService/json/" + operation;
  }
  else
  {
     myURL = IBMIntegration.EmployeeService.IBMContext.protocol + "://"+destHost+":"+destPort+"/EmployeeService/json/" + operation;
  }
  
  var requestData = { };
  requestData[operation] = postData;
  requestData["ClientEnvironment"] = IBMIntegration.ClientEnvironment;
  
  // if a location was supplied, read the certificate data. Otherwise pass undefined on the call.
  var caData   = IBMIntegration.EmployeeService.IBMContext.cacert ? fs.readFileSync(IBMIntegration.EmployeeService.IBMContext.cacert) : undefined;
  var keyData  = IBMIntegration.EmployeeService.IBMContext.key    ? fs.readFileSync(IBMIntegration.EmployeeService.IBMContext.key)    : undefined;
  var certData = IBMIntegration.EmployeeService.IBMContext.cert   ? fs.readFileSync(IBMIntegration.EmployeeService.IBMContext.cert)   : undefined;
  
  myRequest(myURL, 
            { method: "POST", 
              sync: false, 
              handleAs: "json",
              
              // HTTP Basic Auth configuration
              user:     IBMIntegration.EmployeeService.IBMContext.username,
              password: IBMIntegration.EmployeeService.IBMContext.password,
              
              // SSL configuration
              rejectUnauthorized:   IBMIntegration.EmployeeService.IBMContext.rejectUnauthorized,
              
              ca:          caData,
              key:         keyData, 
              cert:        certData,
              passphrase:  IBMIntegration.EmployeeService.IBMContext.certPass,
              
              data: JSON.stringify(requestData)
            }
           ).then(
   function(data) 
   {       
     if ((typeof data === "undefined") || (data == "")) {
        var responseObj = undefined;       
     } else { 
        var responseNameMap = {};
        responseNameMap["getEmployee"] = new Array("getEmployeeResponse");
     
        var operationArray = responseNameMap[operation];

        var keys = Object.keys(data);
        var receivedResponseName = keys[0];     
     
        var index = operationArray.indexOf(receivedResponseName);
        if (index != 0) {
            var faultObjType = Object.prototype.toString.call(data[receivedResponseName]).slice(8, -1);
            if (faultObjType == "String") {
                var errorObj = new SimpleError(receivedResponseName, data[receivedResponseName]);
            } else if (faultObjType == "Object") {
                var errorObj = new ComplexError(receivedResponseName, data[receivedResponseName]);
            }
        } else {
            var responseObj = data[receivedResponseName];
        }
     }

     callback(errorObj, responseObj);    
   },
   function(error) 
   {
     console.log(error);
   }
  );
};

if (typeof global === "undefined")
{
    IBMIntegration.EmployeeService.getEmployee = function(postData, callback)
  {
    request = dojo.require("dojo/request");
    IBMIntegration.EmployeeService.EmployeeServiceInner(request, "", "", "getEmployee", postData, callback);
  };


}
else
{
  global.require(["dojo/request"], function(request) 
  {
        IBMIntegration.EmployeeService.getEmployee = function(postData, callback)
    {
      IBMIntegration.EmployeeService.EmployeeServiceInner(request, IBMIntegration.EmployeeService.IBMContext.hostname, IBMIntegration.EmployeeService.IBMContext.port, "getEmployee", postData, callback);
    }

  }
  );
}
