'use strict'

angular.module('gitApiApp')
  .controller 'RepoCtrl', ($scope, $rootScope, searchAPI) ->
    $rootScope.singleRepo = 'active'
    $rootScope.allRepos = ''
    $scope.gitRepos = ''
    $rootScope.searchStart = false

    $scope.startSearch = (searchTerm)->
      searchAPI.search($scope.gitRepos)

    $scope.newSearch = (searchTerm)->
      $scope.gitRepos = ''
      $rootScope.searchStart = false

    $scope.displayUserInfo = (user)->
      $rootScope.currentUser = user
      searchAPI.getContributorsRepo(user.login)
