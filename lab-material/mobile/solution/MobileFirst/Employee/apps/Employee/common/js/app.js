/**
 * Structure of Angular app
 * 
 * Typically using 1:1:1 for controllers, URLs and views
 * Exceptions are
 *    /app - the home page is abstract in that it is designed to be 'implemented' by other views - it holds the side menu
 *    /wizard - similar idea, wanted to reuse controller across a few pages to collect data from wizard
 */

var app = angular.module('app', ['ionic'])

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
  .state('signin', {
      url: '/sign-in',
      templateUrl: 'views/sign-in.html',
    })
    .state('search', {
      url: "/search",
      templateUrl: "views/search.html",
    })
    .state('result', {
      url: "/result",
      templateUrl: "views/result.html",
    })


  $urlRouterProvider.otherwise("/search");
});

var busyIndicator = new WL.BusyIndicator('content');
app.factory("busyIndicator",function() {
		return busyIndicator;
	}		
);


