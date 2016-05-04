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


#### `blend()`
- `color <[number]>       a color to blend with
- `position <[integer]>`  absolute coordinates of the position to blend
- `moment <number>`       timestamp of the moment to blend
- `<[number]>`            the blended color

Calculate the color of this shape at a given point in time and space, and blend 
it with a given color. `position` __must__ have integer x, y and z coords. 

@todo move code shared by `blend()` and `renderSilhouette()` into a function.  
@todo cache cube bounds at the given moment.  
@todo make all coords everywhere positive - simplifies rounding. 

      blend: (color, position, moment) ->
        M = '/shapelydee/src/Shape/Cube.litcoffee
          Shape.Cube::blend()\n  '

Don’t render if the cube does not exist yet. 

        if @created > moment then return out

Xx. 

        x = position[0] + 10
        y = position[1] + 10

Calculate the origin at the given moment. 

        age = (moment - @created) / 1000 # age in seconds
        origin = [
          @origin[0] + ( @origin[3] * age ) # x
          @origin[1] + ( @origin[4] * age ) # y
          @origin[2] + ( @origin[5] * age ) # z
        ]

Calculate the cube’s bounds at the given moment. 

        w = @scale[0] # width
        h = @scale[1] # height
        l = Math.max -1, origin[0] - (Math.floor w / 2) + 10 # left
        r = Math.min 21, origin[0] + (Math.ceil  w / 2) + 10 # right
        t = Math.max -1, origin[1] - (Math.floor h / 2) + 10 # top
        b = Math.min 21, origin[1] + (Math.ceil  h / 2) + 10 # bottom

Delete the cube if completely out of bounds. 

        #@todo

Calculate integer-bounds. 

        intL = Math.floor l
        intR = Math.ceil  r
        intT = Math.floor t
        intB = Math.ceil  b

Return the color unchanged if its position does not intersect with the cube. 

        return color if intT > y or intB < y or intL > x or intR < x

Calculate the dim-factor, caused by anti-aliasing around the edges. 

        dim = 1
        if intT == y      # anti-alias the top row
          dim = 1 - (t - intT)
        else if intB == y # anti-alias the bottom row
          dim = 1 - (intB - b)
        if intL == x      # anti-alias the left column
          dim = dim * ( 1 - (l - intL) )
        else if intR == x # anti-alias the right column
          dim = dim * ( 1 - (intR - r) )

Apply any dimming, and return the result. 

        color[0] = Math.floor(  Math.min( 255, (color[0] + @color[0] * dim) )  )
        color[1] = Math.floor(  Math.min( 255, (color[1] + @color[1] * dim) )  )
        color[2] = Math.floor(  Math.min( 255, (color[2] + @color[2] * dim) )  )
        return color




#### `renderSilhouette()`
- `out <[array]>             array of arrays of single-character strings
- `moment <number>`          timestamp of the moment to render
- `<[array]>`                modified version of the `out` argument

Render the shape’s silhouette as ASCII. 

      renderSilhouette: (out, moment) ->
        M = '/shapelydee/src/Shape/Cube.litcoffee
          Shape.Cube::renderSilhouette()\n  '

Don’t render if the cube does not exist yet. 

        if @created > moment then return out

Calculate the origin at the given moment. 

        age = (moment - @created) / 1000 # age in seconds
        origin = [
          @origin[0] + ( @origin[3] * age ) # x
          @origin[1] + ( @origin[4] * age ) # y
          @origin[2] + ( @origin[5] * age ) # z
        ]

Calculate the cube’s bounds at the given moment. 

        w = @scale[0] # width
        h = @scale[1] # height
        l = Math.max -1, origin[0] - (Math.floor w / 2) + 10 # left
        r = Math.min 21, origin[0] + (Math.ceil  w / 2) + 10 # right
        t = Math.max -1, origin[1] - (Math.floor h / 2) + 10 # top
        b = Math.min 21, origin[1] + (Math.ceil  h / 2) + 10 # bottom

Delete the cube if completely out of bounds. 

        #@todo

Calculate integer-bounds, so that we can identify which location to draw. 

        intL = Math.floor l
        intR = Math.ceil  r
        intT = Math.floor t
        intB = Math.ceil  b

Render the cube onto `out`. 

        for y in [intT..intB]
          row = out[y]
          if row

            dimY = 1
            if intT == y      # anti-alias the top row
              dimY = 1 - (t - intT)
            else if intB == y # anti-alias the bottom row
              dimY = 1 - (intB - b)

            for x in [intL..intR]
              loc = row[x]
              if loc

                dim = dimY
                if intL == x      # anti-alias the left column
                  dim = dimY * ( 1 - (l - intL) )
                else if intR == x # anti-alias the right column
                  dim = dimY * ( 1 - (intR - r) )

                c = loc.c
                loc.c = if '=' == c || '#' == c then '#' else '='
                loc.r = Math.floor(  Math.min( 255, (loc.r + @color[0] * dim) )  )
                loc.g = Math.floor(  Math.min( 255, (loc.g + @color[1] * dim) )  )
                loc.b = Math.floor(  Math.min( 255, (loc.b + @color[2] * dim) )  )

Xx. 

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
