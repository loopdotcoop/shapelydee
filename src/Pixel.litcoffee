Pixel
=====


#### An RGB ‘read point’, used to represent a real-world LED

    class Pixel
      C: 'Pixel'
      toString: -> '[object Pixel]'


#### `constructor()`
- `config <object> {}`          initial configuration
  - `config.origin <[number]>`  @todo describe
- `<undefined>`                 does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/shapelydee/src/Pixel.litcoffee
          Pixel()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `origin <[number]>`
Coordinates of the pixel. 

        @origin = config.origin #@todo validate




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_x <null>`
@todo describe

        @[oo._]._x = null




Prevent properties being accidentally modified or added to the instance. 

        if 'Pixel' == @C then oo.lock @




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/shapelydee/src/Pixel.litcoffee
          Pixel::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    Pixel.xx = (yy) ->
      M = '/shapelydee/src/Pixel.litcoffee
        Pixel.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;
