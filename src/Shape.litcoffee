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


#### `id <string>`
Unique identifier for this shape. Always begins with 's', to signify 'shape'. 

        @id = 's' + config.id #@todo validate


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


#### `renderId()`
- `out <[array]>             array of arrays of single-character strings
- `<[array]>`                modified version of the `out` argument

Render the shape’s `id` at its origin. When `ShapelyDee::dump()` is called, it 
calls `renderSilhouette()` on each shape, and then calls `renderId()` on each 
shape to overlay the `id`s. 

      renderId: (out) ->
        M = '/shapelydee/src/Shape.litcoffee
          Shape::renderId()\n  '

        l = @id.length # an `id` is always at least 2 characters long
        out[ @origin[1] + 10 ][ @origin[0] + 10 ].c = @id.charAt 0
        if out[ @origin[1] + 10 ][ @origin[0] + 10 + 1 ]
          out[ @origin[1] + 10 ][ @origin[0] + 10 + 1 ].c = @id.charAt 1
        if 2 < l && out[ @origin[1] + 10 ][ @origin[0] + 10 + 2 ]
          out[ @origin[1] + 10 ][ @origin[0] + 10 + 2 ].c = @id.charAt 2
        if 3 < l && out[ @origin[1] + 10 ][ @origin[0] + 10 + 3 ]
          out[ @origin[1] + 10 ][ @origin[0] + 10 + 3 ].c = @id.charAt 3
        return out




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
