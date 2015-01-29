'use strict'

angular.module('gitApiApp')
  .controller 'ReposCtrl', ($scope, $rootScope, searchAPI) ->
    $rootScope.singleRepo = ''
    $rootScope.allRepos = 'active'
    $scope.gitRepos = ''
    $rootScope.searchStart = false

    $scope.startUsernameSearch = (searchTerm)->
      searchAPI.searchAll($scope.gitRepos)

    $scope.newSearch = (searchTerm)->
      $scope.gitRepos = ''
      $rootScope.searchStart = false
