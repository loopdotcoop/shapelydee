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


#### `id <string>`
Unique identifier for this shape. Always begins with 'c', to signify 'cube'. 

        @id = 'c' + config.id #@todo validate




Private Properties
------------------


#### `_x <null>`
@todo describe

        @[oo._]._x = null




Prevent properties being accidentally modified or added to the instance. 

        if 'Shape.Cube' == @C then oo.lock @




Public Methods
--------------


#### `renderSilhouette()`
- `out <[array]>             array of arrays of single-character strings
- `<[array]>`                modified version of the `out` argument

Render the shape’s silhouette as ASCII. 

      renderSilhouette: (out) ->
        M = '/shapelydee/src/Shape.litcoffee
          Shape::renderSilhouette()\n  '

Calculate the cube’s bounds. 

        w = @scale[0] # width
        h = @scale[1] # height
        l = Math.max  0, @origin[0] - (Math.floor w / 2) + 10 # left
        r = Math.min 20, @origin[0] + (Math.ceil  w / 2) + 10 # right
        t = Math.max  0, @origin[1] - (Math.floor h / 2) + 10 # top
        b = Math.min 20, @origin[1] + (Math.ceil  h / 2) + 10 # bottom

Render the cube onto `out`. 

        for y in [t..b]
          for x in [l..r]
            c = out[y][x].c
            out[y][x].c = if '=' == c || '#' == c then '#' else '='
            out[y][x].r = Math.min 255, out[y][x].r + @color[0]
            out[y][x].g = Math.min 255, out[y][x].g + @color[1]
            out[y][x].b = Math.min 255, out[y][x].b + @color[2] #@todo only calc where there is a pixel
        return out



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
