
/* JavaScript content from js/main.js in folder common */
function wlCommonInit(){
	/**
	 * Do not automatically bootstrap Angular in index.html because it needs to be run after starting MFP
	 * Method below performs that	 *     
	 */
	
	console.log("Bootstrapping Angular");
	angular.element(document).ready(function() {
		 angular.bootstrap(document, ['app']);
		 
	 });

	
}

/* JavaScript content from js/main.js in folder iphone */
// This method is invoked after loading the main HTML and successful initialization of the Worklight runtime.
function wlEnvInit(){
    wlCommonInit();
    // Environment initialization code goes here
}