01 ShapelyDee Constructor
=========================

    tudor.add [
      "01 ShapelyDee Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new ShapelyDee]


      "The ShapelyDee class is a function"
      oo.F
      -> ShapelyDee


      "`new` returns an object"
      oo.O
      (shapelydee) -> shapelydee


      tudor.equal


      "`ShapelyDee::C` is 'ShapelyDee'"
      'ShapelyDee'
      (shapelydee) -> shapelydee.C


      "`ShapelyDee::toString()` is '[object ShapelyDee]'"
      '[object ShapelyDee]'
      (shapelydee) -> shapelydee+''




      "Instance properties as expected"


      tudor.equal


      "`ShapelyDee::x` is the number `123`"
      123
      (shapelydee) -> shapelydee.x


      "`ShapelyDee::_shapes` is private, and is an array"
      'array'
      (shapelydee) -> oo.type shapelydee[oo._]._shapes


      "`ShapelyDee::_shapes` is an empty array"
      0
      (shapelydee) -> shapelydee[oo._]._shapes.length


      "`ShapelyDee::_pixels` is private, and is an array"
      'array'
      (shapelydee) -> oo.type shapelydee[oo._]._pixels


      "`ShapelyDee::_pixels` is an empty array"
      0
      (shapelydee) -> shapelydee[oo._]._pixels.length




      "config.pixelCoords usage"


      tudor.equal


      "`config.pixelCoords` can be passed an empty array"
      0
      () -> (new ShapelyDee { pixelCoords:[] } )[oo._]._pixels.length


      "`ShapelyDee::_pixels` contains one Pixel, if pixelCoords is 3 numbers"
      1
      () -> (new ShapelyDee { pixelCoords:[0,1,2] } )[oo._]._pixels.length




"config.pixelCoords exceptions"


tudor.throw


"pixelCoords must not contain 4 numbers"
"""
/shapelydee/src/Pixel.litcoffee Pixel()
config.y is undefined and has no fallback"""
() -> (new ShapelyDee { pixelCoords:[1,2,3,4] } )[oo._]._pixels.length


"pixelCoords must not contain a boolean"
"""
/shapelydee/src/Pixel.litcoffee Pixel()
config.z is type boolean not number"""
() -> (new ShapelyDee { pixelCoords:[1,2,true] } )[oo._]._pixels.length




    ];


