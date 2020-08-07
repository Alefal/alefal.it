var app1 = new Vue({
    el: '#app1',
    data: {
        message: 'Hello Vue!'
    }
})

var app2 = new Vue({
    el: '#app2',
    data: {
        message: 'You loaded this page on ' + new Date().toLocaleString()
    }
})

var app3 = new Vue({
    el: '#app3',
    data: {
        seen: true
    }
})

var app4 = new Vue({
    el: '#app4',
    data: {
        todos: [
            { text: 'Learn JavaScript' },
            { text: 'Learn Vue' },
            { text: 'Build something awesome' }
        ]
    }
})

var app5 = new Vue({
    el: '#app5',
    data: {
        message: 'Hello Vue.js!'
    },
    methods: {
        reverseMessage: function () {
            this.message = this.message.split('').reverse().join('')
        }
    }
})

var app6 = new Vue({
    el: '#app6',
    data: {
        message: 'Hello Vue!'
    }
})

Vue.component('todo-item', {
    props: ['todo'],
    template: '<li>{{ todo.id }} - {{ todo.text }}</li>'
})

var app7 = new Vue({
    el: '#app7',
    data: {
        groceryList: [
            { id: 0, text: 'Vegetables' },
            { id: 1, text: 'Cheese' },
            { id: 2, text: 'Whatever else humans are supposed to eat' }
        ]
    }
})

// Our data object
var obj = {
    foo: 'bar'
}

// Non permette la modifica al valore
Object.freeze(obj)

// The object is added to a Vue instance
new Vue({
    el: '#app8',
    data: obj
})

// Our data object
var data = { a: 1 }

// The object is added to a Vue instance
var vm = new Vue({
    data: data
})

// Getting the property on the instance
// returns the one from the original data
vm.a == data.a // => true

// PROPERTIES
var data = { a: 1 }
var vm = new Vue({
    el: '#app9',
    data: data
})

vm.$data === data // => true
vm.$el === document.getElementById('example') // => true

// $watch is an instance method
vm.$watch('a', function (newValue, oldValue) {
    // This callback will be called when `vm.a` changes
})


new Vue({
    data: {
        a: 1
    },
    created: function () {
        // `this` points to the vm instance
        console.log('a is: ' + this.a)
    }
})
// => "a is: 1"

var vm = new Vue({
    el: '#app10',
    data: {
        firstName: 'Foo',
        lastName: 'Bar'
    },
    computed: {
        fullName: function () {
            return this.firstName + ' ' + this.lastName
        }
    }
})