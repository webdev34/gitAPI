'use strict'

angular.module('gitApiApp')
  .service 'searchAPI', ($http, $q, $rootScope, toastr) ->

    @search = (searchTerm) ->

      searchTermTest = searchTerm.search("https://github.com/")
      searchTermTest2 = searchTerm.search("http://github.com/")

      if searchTermTest is 0
        searchTerm = searchTerm.split("https://github.com/")[1]

      if searchTermTest2 is 0
        searchTerm = searchTerm.split("http://github.com/")[1]

      deferred = $q.defer()
      $http(
        method: 'GET'
        url: 'https://api.github.com/repos/'+ searchTerm
      ).success((data, status, headers, config) ->
          deferred.resolve data
          $rootScope.value = data
          $rootScope.searchStart = true
          toastr.success('Success');
          return
        ).error((data, status, headers, config) ->
            deferred.reject status
            status = 'Invalid Repos, Please enter correct Repos name or URL' if status is 404 or '404'
            toastr.error(status, 'Error');
            return
          )

    @searchAll = (searchTerm) ->

      deferred = $q.defer()
      $http(
        method: 'GET'
        url: 'https://api.github.com/users/'+ searchTerm+'/repos'
      ).success((data, status, headers, config) ->
          deferred.resolve data
          $rootScope.value = data
          $rootScope.searchStart = true
          toastr.success('Success');
          return
        ).error((data, status, headers, config) ->
            deferred.reject status
            $rootScope.searchStart = false
            status = 'Invalid Repos, Please enter correct Repos name or URL' if status is 404 or '404'
            toastr.error(status, 'Error');
            return
          )

    return
