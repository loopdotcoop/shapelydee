SomeClass.FirstSubClass
=======================


#### Inherits from `SomeClass` ...@todo describe

    class SomeClass.FirstSubClass extends SomeClass
      C: 'SomeClass.FirstSubClass'
      toString: -> '[object SomeClass.FirstSubClass]'


#### `constructor()`
- `config <object> {}`       initial configuration
  - `config.x <number> 123`  @todo describe
- `<undefined>`              does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/shapelydee/src/SomeClass/FirstSubClass.litcoffee
          SomeClass.FirstSubClass()\n  '

Call `SomeClass::constructor(config)`. This will create the `@[oo._]` object. 

        super config


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `x <number> 123`
From `config.x`, @todo describe

        @x = v 'x <number>', 123




Private Properties
------------------


#### `_x <null>`
@todo describe

        @[oo._]._x = null




Prevent properties being accidentally modified or added to the instance. 

        if 'SomeClass.FirstSubClass' == @C then oo.lock @




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/shapelydee/src/SomeClass/FirstSubClass.litcoffee
          SomeClass::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    SomeClass.FirstSubClass.xx = (yy) ->
      M = '/shapelydee/src/SomeClass/FirstSubClass.litcoffee
        SomeClass.FirstSubClass.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;
