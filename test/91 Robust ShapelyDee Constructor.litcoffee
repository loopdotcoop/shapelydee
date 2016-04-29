91 Robust ShapelyDee Constructor
================================

    if oo.ROBUSTABLE
      tudor.add [
        "91 Robust ShapelyDee Constructor (for modern UAs)"
        tudor.is




        "Class members are immutable in modern UAs"

Prepare a test-instance. 

        -> [new ShapelyDee]


        "Cannot add a property to the ShapelyDee class"
        oo.U
        -> ShapelyDee.nope = 123; ShapelyDee.nope


        "Cannot add a property to the ShapelyDee class’s prototype object"
        oo.U
        (shapelydee) -> ShapelyDee::nope = 456; shapelydee.nope


        tudor.equal


        "`ShapelyDee::C` is a constant"
        'ShapelyDee'
        (shapelydee) -> shapelydee.C = 'changed!'; shapelydee.C



      ];

