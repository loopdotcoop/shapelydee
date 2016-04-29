Shape
=====


#### Base class for all shapes, such as `Shape.Cube`

    class Shape
      C: 'Shape'
      toString: -> '[object Shape]'


#### `constructor()`
- `config <object> {}`            initial configuration
  - `config.origin   <[number]>`  @todo describe
  - `config.scale    <[number]>`  @todo describe
  - `config.rotation <[number]>`  @todo describe
  - `config.color    <[number]>`  @todo describe
  - `config.blend    <string>`    @todo describe
- `<undefined>`                   does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/shapelydee/src/Shape.litcoffee
          Shape()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `origin <[number]>`
Coordinates of the shape. 

        @origin = config.origin #@todo validate


#### `scale <[number]>`
Scale of the shape. 

        @scale = config.scale #@todo validate


#### `rotation <[number]>`
Rotation of the shape. 

        @rotation = config.rotation #@todo validate


#### `color <[number]>`
Color of the shape in RGB, where each value is an integer from 0 to 255. 

        @color = config.color #@todo validate


#### `blend <string>`
Blend mode of the shape, eg 'screen' to add RGB value together. 

        @blend = config.blend #@todo validate





Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_x <null>`
@todo describe

        @[oo._]._x = null




Prevent properties being accidentally modified or added to the instance. 

        if 'Shape' == @C then oo.lock @




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/shapelydee/src/Shape.litcoffee
          Shape::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    Shape.xx = (yy) ->
      M = '/shapelydee/src/Shape.litcoffee
        Shape.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;
