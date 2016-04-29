ShapelyDee
==========


#### The main class for ShapelyDee

    class ShapelyDee
      C: 'ShapelyDee'
      toString: -> '[object ShapelyDee]'


#### `constructor()`
- `config <object> {}`                  initial configuration
  - `config.x <number> 123`             @todo describe
  - `config.pixelCoords <[number]> []`  Coordinates of the initial Pixels
- `<undefined>`                         does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/shapelydee/src/ShapelyDee.litcoffee
          ShapelyDee()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `x <number> 123`
From `config.x`, @todo describe

        @x = v 'x <number>', 123




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_shapes <[Shape]>`
@todo describe

        @[oo._]._shapes = []


#### `_pixels <[Pixel]>`
@todo describe

        @[oo._]._pixels = [] #@todo validate pixelCoords
        px = config.pixelCoords || []
        i = 0
        while ! oo.isU px[i]
          @[oo._]._pixels.push new Pixel
            id:     @[oo._]._pixels.length # id is based on index
            origin: [ px[i++], px[i++], px[i++] ]




Prevent properties being accidentally modified or added to the instance. 

        if 'ShapelyDee' == @C then oo.lock @




Public Methods
--------------


#### `add()`
- `config <object> {}`                    description of what will be added
  - `config.a <string>`                   eg 'pixel' or 'cube'
  - `config.origin <[number]6>`           coordinates of the pixel or shape
  - `config.scale <[number]6> null`       (Optional) if a shape, its scale
  - `config.rotation <[number]6> null`    (Optional) if a shape, its rotation
  - `config.color <[number]6> null`       (Optional) if a shape, its RGB color
  - `config.blend <string> 'screen'`      (Optional) if a shape, its blend-mode
- `<number>`                              unique ID of the added item

The origin, scale, rotation and color all take six values. The first three are 
the current (x, y, z) values. The second three represent the direction and 
magnitude of movement for x, y and z, relative to the first three values. So if 
the second three are equal to the first, no movement will happen. 

      add: (config) ->
        M = '/shapelydee/src/ShapelyDee.litcoffee
          ShapelyDee::add()\n  '

Check that the config is valid, or fallback to defaults if undefined. 

        v = oo.vObject M, 'config', config
        a = v 'a <string ^pixel|cube$>'
        origin   = config.origin
        scale    = config.scale
        rotation = config.rotation
        color    = config.color
        blend    = config.blend
        #@todo remaining config

        if 'pixel' == a
          return @[oo._]._pixels.push new Pixel
            id      : @[oo._]._pixels.length # id is based on index
            origin  : origin

        if 'cube' == a
          return @[oo._]._shapes.push new Shape.Cube
            id      : @[oo._]._pixels.length # id is based on index
            origin  : origin
            scale   : scale
            rotation: rotation
            color   : color
            blend   : blend


#### `dump()`
- `format <string ^ascii|led$> 'led'`  the format to output
- `<string|[integer]>`                 string if 'ascii', array if 'led'

@todo describe

      dump: (format) ->
        M = '/shapelydee/src/ShapelyDee.litcoffee
          ShapelyDee::dump()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        format = oo.vArg M, format, 'format <string ^ascii|led$>', 'led'

Xx. 

        if 'ascii' == format

Render the background grid as an array of arrays. 

          out = []
          for y in [0..21]
            out[y] = []
            for x in [0..21]
              out[y].push
                c: if 10 == x then '|' else if 10 == y then '-' else '·'
                r: 0
                g: 0
                b: 0

Draw each Shape’s silhoutte. 

          for shape,i in @[oo._]._shapes
            out = shape.renderSilhouette out

Overlay each Shape’s `id`. 

          for shape,i in @[oo._]._shapes
            out = shape.renderId out

Overlay each Pixel, and create a table showing each pixel’s color. 

          table = []
          for pixel,i in @[oo._]._pixels
            loc = out[ pixel.origin[1] + 10 ][ pixel.origin[0] + 10 ] # location
            loc.c = '*'
            table.push { id:pixel.id, r:loc.r+'', g:loc.g+'', b:loc.b+'' }

Convert each row to a string. 

          for y in [0..21]
            row = ''
            for x in [0..21]
              row += out[y][x].c
            out[y] = row

Append a table showing each pixel’s color. 

          for row,i in table
            out.push "#{oo.pad row.id,4}#{oo.rpad row.r,4}#{oo.rpad row.g,4}#{oo.rpad row.b,4}"

Convert to a string and return the result. 

          return out.join '\n'


Xx. 

        if 'led' == format
          return [10,20,30] #@todo




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    ShapelyDee.xx = (yy) ->
      M = '/shapelydee/src/ShapelyDee.litcoffee
        ShapelyDee.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123





Private Variables and Functions
-------------------------------

These have module-wide scope. Any code in the ShapelyDee module can access them. 


#### `x <null>`
@todo describe

    x = null


#### `xx()`
- `yy <number>`  @todo describe
- `<undefined>`  does not return anything

To simulate a private method, use `xx.call(@, yy)`. @todo describe

    xx = (yy) ->
      M = '/shapelydee/src/ShapelyDee.litcoffee
        xx()\n  '




    ;
