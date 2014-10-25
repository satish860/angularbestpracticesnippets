(function () {
  'use strict';

  angular
    .module('todoModule')
    .factory('someFactory', someFactory);

  /* @ngInject */
  function someFactory($http) {
    var service = {
      Completed: Completed
    };
    return service;

    ////////////////

    function Completed() {}
  }
})();
