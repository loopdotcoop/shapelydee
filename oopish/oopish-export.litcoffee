Export Module
=============

#### The module’s only entry-point is the `ShapelyDee` class


Prevent properties being accidentally modified or added to the classes. 
@todo automate this

    oo.lock ShapelyDee
    oo.lock SomeClass
    oo.lock SomeClass.FirstSubClass
    oo.lock SomeClass.SecondSubClass

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if oo.F == typeof define and define.amd
      define -> ShapelyDee

Next, try exporting for CommonJS, eg for [Node.js](http://goo.gl/Lf84YI):  
`var ShapelyDee = require('shapelydee');`

    else if oo.O == typeof module and module and module.exports
      module.exports = ShapelyDee

Otherwise, add the `ShapelyDee` class to global scope.  
Browser usage: `var shapelydee = new window.ShapelyDee();`

    else oo.G.ShapelyDee = ShapelyDee


    ;
