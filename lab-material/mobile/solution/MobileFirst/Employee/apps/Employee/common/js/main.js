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
