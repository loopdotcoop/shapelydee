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


      "`ShapelyDee::_x` is private, and is null"
      null
      (shapelydee) -> shapelydee[oo._]._x




    ];


