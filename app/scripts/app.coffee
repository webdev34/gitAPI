'use strict'

angular
  .module('gitApiApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'toastr'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/repo.html'
        controller: 'RepoCtrl'
      .when '/user-repos',
        templateUrl: 'views/repos.html'
        controller: 'ReposCtrl'
      .otherwise
        redirectTo: '/'
