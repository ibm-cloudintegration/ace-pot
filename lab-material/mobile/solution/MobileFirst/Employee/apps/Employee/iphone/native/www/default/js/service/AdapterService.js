
/* JavaScript content from js/service/AdapterService.js in folder common */
/**
 * The Adapter factory 
 * Provides generic adapter call capability using promises
 */
app.factory('Adapter', function($q) {
  return {
    
    invokeProcedure : function(adapterName, procedure, parameters){
		console.log("In Service Method");
		var deferred = $q.defer();
		var invocationData = {
				adapter : adapterName,
				procedure : procedure,
				parameters : parameters
			};
		
		WL.Client.invokeProcedure(invocationData,{
			onSuccess : $.proxy(function(data)
			{
				deferred.resolve(data.invocationResult);
			},this),
			onFailure :  $.proxy(function(error)
			{
				deferred.reject(error);
			},this)
		});
		return deferred.promise;
    	
    }
  };
});
