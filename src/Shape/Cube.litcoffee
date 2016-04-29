Shape.Cube
==========


#### A shape with six square sides, eight vertices and twelve equal edges

    class Shape.Cube extends Shape
      C: 'Shape.Cube'
      toString: -> '[object Shape.Cube]'


#### `constructor()`
- `config <object> {}`       initial configuration
  - `config.x <number> 123`  @todo describe
- `<undefined>`              does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/shapelydee/src/Shape/Cube.litcoffee
          Shape.Cube()\n  '

Call `Shape::constructor(config)`. This will create the `@[oo._]` object. 

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

        if 'Shape.Cube' == @C then oo.lock @




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/shapelydee/src/Shape/Cube.litcoffee
          Shape::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    Shape.Cube.xx = (yy) ->
      M = '/shapelydee/src/Shape/Cube.litcoffee
        Shape.Cube.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;
