'use strict'

describe 'Controller: RepoCtrl', ->

  # load the controller's module
  beforeEach module 'gitApiApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'RepoCtrl', {
      $scope: scope
    }

  # it 'should attach a list of awesomeThings to the scope', ->
  #   expect(scope.awesomeThings.length).toBe 3
