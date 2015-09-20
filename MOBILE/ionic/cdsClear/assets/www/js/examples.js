angular.module('starter.controllers', [])

//START: Example SERVICE, FACTORY, PROVIDER
.service('helloWorldFromService', function() {
    this.sayHello = function() {
        return "Hello, World!"
    };
})
.factory('helloWorldFromFactory', function() {
    return {
        sayHello: function() {
            return "Hello, World!"
        }
    };
})
.provider('helloWorld', function() {
    // In the provider function, you cannot inject any
    // service or factory. This can only be done at the
    // "$get" method.

    this.name = 'Default';

    this.$get = function() {
        var name = this.name;
        return {
            sayHello: function() {
                return "Hello, " + name + "!"
            }
        }
    };

    this.setName = function(name) {
        this.name = name;
    };
});
//END: Example SERVICE, FACTORY, PROVIDER