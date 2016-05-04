// Generated by CoffeeScript 1.9.2
/*! Shapelydee 0.0.9 //// MIT Licence //// http://shapelydee.loop.coop/ */
(function(global) {

/* Define the Oopish container. 
Rather than just a generic object, the Oopish container can also be used as 
a handy shortcut for console.log(). Note bind() (http://goo.gl/66ffgl), and 
unusual IE8-9 behaviour (http://goo.gl/ZmG9Xs). */
var oo = (function (c) { return (
(!c || !c.log) // IE8-9 without F12 dev-tools, IE6-7, FF1-3.6
? function () {}
: ("object" === typeof c.log) // IE8-9 with F12 dev-tools
? function () { c.log([].slice.call(arguments).join(" ")) }
: (! Function.prototype.bind) // OP10.6-11.5, SF4-5.0, iOS3-5.1, ADRD2.1-3.0?
? function () { c.log.apply(c, arguments) }
: c.log.bind(c)
)}(global.console));

/* Define constants generated by oopish-build and injected into app-scope. */
oo.G = global // global scope, passed into the closure as an argument
oo.T = "Shapelydee" // project title, from package.json
oo.V = "0.0.9" // project version, from package.json


/*! Shapelydee 0.0.9 */
var Pixel, Shape, ShapelyDee, x, xx,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

oo.A = 'array';

oo.B = 'boolean';

oo.D = 'document';

oo.E = 'error';

oo.F = 'function';

oo.I = 'integer';

oo.N = 'number';

oo.O = 'object';

oo.R = 'regexp';

oo.S = 'string';

oo.U = 'undefined';

oo.X = 'null';

oo._ = (Math.random().toString(36) + '00000000').substr(2, 8);

oo.ROBUSTABLE = (function() {
  if (!Object.preventExtensions) {
    return false;
  } else if (Object.defineProperty) {
    try {
      Object.defineProperty({}, 'x', {});
      return true;
    } catch (_error) {
      return false;
    }
  } else {
    return true;
  }
})();

oo.is = function(c, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (c) {
    return t;
  } else {
    return f;
  }
};

oo.isU = function(x) {
  return oo.U === typeof x;
};

oo.isX = function(x) {
  return null === x;
};

oo.type = function(a) {
  var ta;
  if (oo.isX(a)) {
    return oo.X;
  }
  ta = typeof a;
  if ({
    undefined: 1,
    string: 1,
    number: 1,
    boolean: 1
  }[ta]) {
    return ta;
  }
  if (!a.nodeName && a.constructor !== Array && /function/i.test('' + a)) {
    return oo.F;
  }
  return {}.toString.call(a).match(/\s([a-z0-9]+)/i)[1].toLowerCase();
};

oo.ex = function(x, a, b) {
  var pos;
  if (-1 === (pos = a.indexOf(x))) {
    return x;
  } else {
    return b.charAt(pos);
  }
};

oo.has = function(h, n, t, f) {
  if (t == null) {
    t = true;
  }
  if (f == null) {
    f = false;
  }
  if (-1 !== h.indexOf(n)) {
    return t;
  } else {
    return f;
  }
};

oo.uid = function(p) {
  if (p == null) {
    p = 'id';
  }
  return p + '_' + (Math.random().toString(36) + '00000000').substr(2, 8);
};

oo.uid62 = function(p, l) {
  var c;
  if (p == null) {
    p = 'id';
  }
  if (l == null) {
    l = 8;
  }
  c = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  return p + '_' + ((function() {
    var results;
    results = [];
    while (l--) {
      results.push(c.charAt(Math.floor(Math.random() * 62)));
    }
    return results;
  })()).join('');
};

oo.pad = oo.lpad = function(s, l, c) {
  if (c == null) {
    c = ' ';
  }
  return s + Array(l - s.length + 1).join(c);
};

oo.rpad = function(s, l, c) {
  if (c == null) {
    c = ' ';
  }
  return Array(l - s.length + 1).join(c) + s;
};

oo.insert = function(basis, overlay, offset) {
  return basis.slice(0, offset) + overlay + basis.slice(offset + overlay.length);
};

if (oo.ROBUSTABLE) {
  oo.define = function(obj, name, value, kind) {
    switch (kind) {
      case 'constant':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: true
        });
      case 'private':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: false
        });
    }
  };
} else {
  oo.define = function(obj, name, value, kind) {
    return obj[name] = value;
  };
}

if (oo.ROBUSTABLE) {
  oo.lock = function(obj) {
    var j, key, len, ref;
    ref = Object.keys(obj);
    for (j = 0, len = ref.length; j < len; j++) {
      key = ref[j];
      Object.defineProperty(obj, key, {
        writable: false,
        configurable: false
      });
    }
    Object.preventExtensions(obj);
    if (obj.prototype && obj !== obj.prototype) {
      return oo.lock(obj.prototype);
    }
  };
} else {
  oo.lock = function() {};
}

oo.vArray = function(M, arr, signature, fallback) {
  var i, j, k, len, len1, limit, matches, max, min, pass, ref, ref1, ref2, rule, tv, type, types, value;
  matches = signature.match(/^<\[([|a-z]+)\s*(.*)\](\d+-\d+)?>$/i);
  if (!matches) {
    throw RangeError("/shapelydee/oopish/oo-helpers.litcoffee oo.vArray()\n  signature " + signature + " is invalid");
  }
  signature = matches[0], types = matches[1], rule = matches[2], limit = matches[3];
  if (!arr) {
    return fallback;
  }
  if (oo.A !== oo.type(arr)) {
    throw RangeError(M + (" is type " + (oo.type(arr)) + " not array"));
  }
  if (limit) {
    ref = limit.split('-'), min = ref[0], max = ref[1];
    if (arr.length < min || arr.length > max) {
      throw RangeError(M + (".length is " + arr.length + " (must be " + limit + ")"));
    }
  }
  if ('any' === types) {
    return arr;
  }
  for (i = j = 0, len = arr.length; j < len; i = ++j) {
    value = arr[i];
    tv = oo.type(value);
    pass = false;
    ref1 = types.split('|');
    for (k = 0, len1 = ref1.length; k < len1; k++) {
      type = ref1[k];
      if ((oo.N === type || oo.I === type) && oo.N === tv) {
        if (oo.I === type && value % 1) {
          throw RangeError(M + ("[" + i + "] is a number but not an integer"));
        }
        if (rule) {
          ref2 = rule.split('-'), min = ref2[0], max = ref2[1];
          if (value < min || value > max) {
            throw RangeError(M + ("[" + i + "] is " + value + " (must be " + rule + ")"));
          }
        }
        pass = true;
        break;
      }
      if (type === tv) {
        if (oo.S === tv && rule) {
          if (!RegExp(rule).test(value)) {
            throw RangeError(M + ("[" + i + "] fails " + rule));
          }
        }
        pass = true;
        break;
      }
      if (/^[A-Z]/.test(type)) {
        if (oo.O === tv) {
          if (eval("value instanceof " + type)) {
            pass = true;
            break;
          }
        }
      }
    }
    if (pass) {
      continue;
    }
    throw TypeError(M + ("[" + i + "] is type " + tv + " not " + types));
  }
  return arr;
};

oo.vArg = function(M, value, signature, fallback) {
  var j, key, len, matches, max, min, pfx, ref, ref1, rule, tv, type, types;
  matches = signature.match(/^([_a-z][_a-z0-9]*)\s+<([|a-z]+)\s*(.*)>$/i);
  if (!matches) {
    throw RangeError("/shapelydee/oopish/oo-helpers.litcoffee oo.vArg()\n  signature " + signature + " is invalid");
  }
  signature = matches[0], key = matches[1], types = matches[2], rule = matches[3];
  pfx = M + ("argument " + key + " ");
  tv = oo.type(value);
  if (oo.U === tv) {
    if (4 === arguments.length) {
      return fallback;
    }
    throw TypeError(pfx + "is undefined and has no fallback");
  }
  ref = types.split('|');
  for (j = 0, len = ref.length; j < len; j++) {
    type = ref[j];
    if ((oo.N === type || oo.I === type) && oo.N === tv) {
      if (oo.I === type && value % 1) {
        throw RangeError(pfx + "is a number but not an integer");
      }
      if (rule) {
        ref1 = rule.split('-'), min = ref1[0], max = ref1[1];
        if (value < min || value > max) {
          throw RangeError(pfx + ("is " + value + " (must be " + rule + ")"));
        }
      }
      return value;
    }
    if (type === tv) {
      if (oo.S === tv && rule) {
        if (!RegExp(rule).test(value)) {
          throw RangeError(pfx + ("fails " + rule));
        }
      }
      return value;
    }
    if (/^[A-Z]/.test(type)) {
      if (oo.O === tv) {
        if (eval("value instanceof " + type)) {
          return value;
        }
      }
    }
  }
  throw TypeError(pfx + ("is type " + tv + " not " + types));
};

oo.vObject = function(M, objName, obj) {
  if (oo.O !== oo.type(obj)) {
    throw TypeError(M + objName + (" is type " + (oo.type(obj)) + " not object"));
  }
  return function(signature, fallback) {
    var j, key, len, matches, max, min, ref, ref1, rule, tv, type, types, value;
    matches = signature.match(/^([_a-z][_a-z0-9]*)\s+<([|a-z]+)\s*(.*)>$/i);
    if (!matches) {
      throw RangeError("/shapelydee/oopish/oo-helpers.litcoffee oo.vObject()\n  signature " + signature + " is invalid");
    }
    signature = matches[0], key = matches[1], types = matches[2], rule = matches[3];
    value = obj[key];
    tv = oo.type(value);
    if (oo.U === tv) {
      if (2 === arguments.length) {
        return fallback;
      }
      throw TypeError(M + objName + '.' + key + " is undefined and has no fallback");
    }
    ref = types.split('|');
    for (j = 0, len = ref.length; j < len; j++) {
      type = ref[j];
      if ((oo.N === type || oo.I === type) && oo.N === tv) {
        if (oo.I === type && value % 1) {
          throw RangeError(M + objName + '.' + key + " is a number but not an integer");
        }
        if (rule) {
          ref1 = rule.split('-'), min = ref1[0], max = ref1[1];
          if (value < min || value > max) {
            throw RangeError(M + objName + '.' + key + (" is " + value + " (must be " + rule + ")"));
          }
        }
        return value;
      }
      if (type === tv) {
        if (oo.S === tv && rule) {
          if (!RegExp(rule).test(value)) {
            throw RangeError(M + objName + '.' + key + (" fails " + rule));
          }
        }
        return value;
      }
      if (/^[A-Z]/.test(type)) {
        if (oo.O === tv) {
          if (eval("value instanceof " + type)) {
            return value;
          }
        }
      }
    }
    throw TypeError(M + objName + '.' + key + (" is type " + tv + " not " + types));
  };
};

Pixel = (function() {
  Pixel.prototype.C = 'Pixel';

  Pixel.prototype.toString = function() {
    return '[object Pixel]';
  };

  function Pixel(config) {
    var M, v;
    if (config == null) {
      config = {};
    }
    M = '/shapelydee/src/Pixel.litcoffee Pixel()\n  ';
    v = oo.vObject(M, 'config', config);
    this.id = 'p' + config.id;
    this.origin = config.origin;
    oo.define(this, oo._, {}, 'private');
    this[oo._]._x = null;
    if ('Pixel' === this.C) {
      oo.lock(this);
    }
  }

  Pixel.prototype.xx = function(yy) {
    var M;
    M = '/shapelydee/src/Pixel.litcoffee Pixel::xx()\n  ';
    return yy = oo.vArg(M, yy, 'yy <number>', 123);
  };

  return Pixel;

})();

Pixel.xx = function(yy) {
  var M;
  M = '/shapelydee/src/Pixel.litcoffee Pixel.xx()\n  ';
  return yy = oo.vArg(M, yy, 'yy <number>', 123);
};

Shape = (function() {
  Shape.prototype.C = 'Shape';

  Shape.prototype.toString = function() {
    return '[object Shape]';
  };

  function Shape(config) {
    var M, v;
    if (config == null) {
      config = {};
    }
    M = '/shapelydee/src/Shape.litcoffee Shape()\n  ';
    v = oo.vObject(M, 'config', config);
    this.id = 's' + config.id;
    this.created = config.created;
    this.origin = config.origin;
    this.scale = config.scale;
    this.rotation = config.rotation;
    this.color = config.color;
    this.blend = config.blend;
    oo.define(this, oo._, {}, 'private');
    this[oo._]._x = null;
    if ('Shape' === this.C) {
      oo.lock(this);
    }
  }

  Shape.prototype.renderId = function(out, moment) {
    var M, age, i, l, origin, ref, row;
    M = '/shapelydee/src/Shape.litcoffee Shape::renderId()\n  ';
    if (this.created > moment) {
      return out;
    }
    age = (moment - this.created) / 1000;
    origin = [Math.round(this.origin[0] + (this.origin[3] * age)), Math.round(this.origin[1] + (this.origin[4] * age)), Math.round(this.origin[2] + (this.origin[5] * age))];
    row = out[origin[1] + 10];
    if (row) {
      i = 0;
      l = this.id.length;
      while (i < l) {
        if ((ref = row[origin[0] + 10 + i]) != null) {
          ref.c = this.id.charAt(i);
        }
        i++;
      }
    }
    return out;
  };

  return Shape;

})();

Shape.xx = function(yy) {
  var M;
  M = '/shapelydee/src/Shape.litcoffee Shape.xx()\n  ';
  return yy = oo.vArg(M, yy, 'yy <number>', 123);
};

ShapelyDee = (function() {
  ShapelyDee.prototype.C = 'ShapelyDee';

  ShapelyDee.prototype.toString = function() {
    return '[object ShapelyDee]';
  };

  function ShapelyDee(config) {
    var M, i, px, v;
    if (config == null) {
      config = {};
    }
    M = '/shapelydee/src/ShapelyDee.litcoffee ShapelyDee()\n  ';
    v = oo.vObject(M, 'config', config);
    this.x = v('x <number>', 123);
    oo.define(this, oo._, {}, 'private');
    this[oo._]._format = 'led';
    this[oo._]._shapes = [];
    this[oo._]._pixels = [];
    px = config.pixelCoords || [];
    i = 0;
    while (!oo.isU(px[i])) {
      this[oo._]._pixels.push(new Pixel({
        id: this[oo._]._pixels.length,
        origin: [px[i++], px[i++], px[i++]]
      }));
    }
    if ('ShapelyDee' === this.C) {
      oo.lock(this);
    }
  }

  ShapelyDee.prototype.add = function(config) {
    var M, a, blend, color, created, origin, rotation, scale, v;
    M = '/shapelydee/src/ShapelyDee.litcoffee ShapelyDee::add()\n  ';
    v = oo.vObject(M, 'config', config);
    a = v('a <string ^pixel|cube$>');
    origin = config.origin;
    created = config.created;
    scale = config.scale;
    rotation = config.rotation;
    color = config.color;
    blend = config.blend;
    if ('pixel' === a) {
      return this[oo._]._pixels.push(new Pixel({
        id: this[oo._]._pixels.length,
        origin: origin
      }));
    }
    if ('cube' === a) {
      return this[oo._]._shapes.push(new Shape.Cube({
        id: this[oo._]._shapes.length,
        origin: origin,
        created: created,
        scale: scale,
        rotation: rotation,
        color: color,
        blend: blend
      }));
    }
  };

  ShapelyDee.prototype.dump = function(format, moment) {
    var M, aa, ab, ac, ad, ae, af, color, i, j, k, len, len1, len2, len3, len4, len5, len6, loc, m, o, out, pixel, q, ref, ref1, ref2, ref3, ref4, row, shape, table, u, x, y, z;
    M = '/shapelydee/src/ShapelyDee.litcoffee ShapelyDee::dump()\n  ';
    format = oo.vArg(M, format, 'format <string ^ascii|html|led$>', this[oo._]._format);
    this[oo._]._format = format;
    oo.vArg(M, moment, 'moment <number>');
    if ('ascii' === format || 'html' === format) {
      out = [];
      for (y = j = 0; j <= 20; y = ++j) {
        out[y] = [];
        for (x = k = 0; k <= 20; x = ++k) {
          out[y].push({
            c: 10 === x ? '|' : 10 === y ? '-' : '·',
            r: 0,
            g: 0,
            b: 0
          });
        }
      }
      ref = this[oo._]._shapes;
      for (i = m = 0, len = ref.length; m < len; i = ++m) {
        shape = ref[i];
        out = shape.renderSilhouette(out, moment);
      }
      ref1 = this[oo._]._shapes;
      for (i = o = 0, len1 = ref1.length; o < len1; i = ++o) {
        shape = ref1[i];
        out = shape.renderId(out, moment);
      }
      table = [];
      ref2 = this[oo._]._pixels;
      for (i = q = 0, len2 = ref2.length; q < len2; i = ++q) {
        pixel = ref2[i];
        loc = out[pixel.origin[1] + 10][pixel.origin[0] + 10];
        loc.c = '*';
        table.push({
          id: pixel.id,
          r: loc.r + '',
          g: loc.g + '',
          b: loc.b + ''
        });
      }
      if ('html' === format) {
        for (y = u = 0; u <= 20; y = ++u) {
          row = '<div>';
          for (x = z = 0; z <= 20; x = ++z) {
            loc = out[y][x];
            row += '*' === loc.c ? '<i ' : '<b ';
            row += "style='background:rgb(" + loc.r + "," + loc.g + "," + loc.b + ")'>" + loc.c;
            row += '*' === loc.c ? '</i>' : '</b>';
          }
          out[y] = row + '</div>';
        }
      } else {
        for (y = aa = 0; aa <= 20; y = ++aa) {
          row = '';
          for (x = ab = 0; ab <= 20; x = ++ab) {
            row += out[y][x].c;
          }
          out[y] = row;
        }
      }
      if ('html' === format) {
        for (i = ac = 0, len3 = table.length; ac < len3; i = ++ac) {
          row = table[i];
          out.push("<b style='color:rgb(" + row.r + "," + row.g + "," + row.b + ")'>" + (oo.pad(row.id, 4)) + "</b>" + (oo.rpad(row.r, 4)) + (oo.rpad(row.g, 4)) + (oo.rpad(row.b, 4)));
        }
      } else {
        for (i = ad = 0, len4 = table.length; ad < len4; i = ++ad) {
          row = table[i];
          out.push("" + (oo.pad(row.id, 4)) + (oo.rpad(row.r, 4)) + (oo.rpad(row.g, 4)) + (oo.rpad(row.b, 4)));
        }
      }
      return out.join('\n');
    }
    if ('led' === format) {
      out = [];
      ref3 = this[oo._]._pixels;
      for (ae = 0, len5 = ref3.length; ae < len5; ae++) {
        pixel = ref3[ae];
        color = [0, 0, 0];
        ref4 = this[oo._]._shapes;
        for (af = 0, len6 = ref4.length; af < len6; af++) {
          shape = ref4[af];
          color = shape.blend(color, pixel.origin, moment);
        }
        out = out.concat(color);
      }
      return out;
    }
  };

  return ShapelyDee;

})();

ShapelyDee.xx = function(yy) {
  var M;
  M = '/shapelydee/src/ShapelyDee.litcoffee ShapelyDee.xx()\n  ';
  return yy = oo.vArg(M, yy, 'yy <number>', 123);
};

x = null;

xx = function(yy) {
  var M;
  return M = '/shapelydee/src/ShapelyDee.litcoffee xx()\n  ';
};

Shape.Cube = (function(superClass) {
  extend(Cube, superClass);

  Cube.prototype.C = 'Shape.Cube';

  Cube.prototype.toString = function() {
    return '[object Shape.Cube]';
  };

  function Cube(config) {
    var M, v;
    if (config == null) {
      config = {};
    }
    M = '/shapelydee/src/Shape/Cube.litcoffee Shape.Cube()\n  ';
    Cube.__super__.constructor.call(this, config);
    v = oo.vObject(M, 'config', config);
    this.id = 'c' + config.id;
    this[oo._]._x = null;
    if ('Shape.Cube' === this.C) {
      oo.lock(this);
    }
  }

  Cube.prototype.blend = function(color, position, moment) {
    var M, age, b, dim, h, intB, intL, intR, intT, l, origin, r, t, w, y;
    M = '/shapelydee/src/Shape/Cube.litcoffee Shape.Cube::blend()\n  ';
    if (this.created > moment) {
      return out;
    }
    x = position[0] + 10;
    y = position[1] + 10;
    age = (moment - this.created) / 1000;
    origin = [this.origin[0] + (this.origin[3] * age), this.origin[1] + (this.origin[4] * age), this.origin[2] + (this.origin[5] * age)];
    w = this.scale[0];
    h = this.scale[1];
    l = Math.max(-1, origin[0] - (Math.floor(w / 2)) + 10);
    r = Math.min(21, origin[0] + (Math.ceil(w / 2)) + 10);
    t = Math.max(-1, origin[1] - (Math.floor(h / 2)) + 10);
    b = Math.min(21, origin[1] + (Math.ceil(h / 2)) + 10);
    intL = Math.floor(l);
    intR = Math.ceil(r);
    intT = Math.floor(t);
    intB = Math.ceil(b);
    if (intT > y || intB < y || intL > x || intR < x) {
      return color;
    }
    dim = 1;
    if (intT === y) {
      dim = 1 - (t - intT);
    } else if (intB === y) {
      dim = 1 - (intB - b);
    }
    if (intL === x) {
      dim = dim * (1 - (l - intL));
    } else if (intR === x) {
      dim = dim * (1 - (intR - r));
    }
    color[0] = Math.floor(Math.min(255, color[0] + this.color[0] * dim));
    color[1] = Math.floor(Math.min(255, color[1] + this.color[1] * dim));
    color[2] = Math.floor(Math.min(255, color[2] + this.color[2] * dim));
    return color;
  };

  Cube.prototype.renderSilhouette = function(out, moment) {
    var M, age, b, c, dim, dimY, h, intB, intL, intR, intT, j, k, l, loc, origin, r, ref, ref1, ref2, ref3, row, t, w, y;
    M = '/shapelydee/src/Shape/Cube.litcoffee Shape.Cube::renderSilhouette()\n  ';
    if (this.created > moment) {
      return out;
    }
    age = (moment - this.created) / 1000;
    origin = [this.origin[0] + (this.origin[3] * age), this.origin[1] + (this.origin[4] * age), this.origin[2] + (this.origin[5] * age)];
    w = this.scale[0];
    h = this.scale[1];
    l = Math.max(-1, origin[0] - (Math.floor(w / 2)) + 10);
    r = Math.min(21, origin[0] + (Math.ceil(w / 2)) + 10);
    t = Math.max(-1, origin[1] - (Math.floor(h / 2)) + 10);
    b = Math.min(21, origin[1] + (Math.ceil(h / 2)) + 10);
    intL = Math.floor(l);
    intR = Math.ceil(r);
    intT = Math.floor(t);
    intB = Math.ceil(b);
    for (y = j = ref = intT, ref1 = intB; ref <= ref1 ? j <= ref1 : j >= ref1; y = ref <= ref1 ? ++j : --j) {
      row = out[y];
      if (row) {
        dimY = 1;
        if (intT === y) {
          dimY = 1 - (t - intT);
        } else if (intB === y) {
          dimY = 1 - (intB - b);
        }
        for (x = k = ref2 = intL, ref3 = intR; ref2 <= ref3 ? k <= ref3 : k >= ref3; x = ref2 <= ref3 ? ++k : --k) {
          loc = row[x];
          if (loc) {
            dim = dimY;
            if (intL === x) {
              dim = dimY * (1 - (l - intL));
            } else if (intR === x) {
              dim = dimY * (1 - (intR - r));
            }
            c = loc.c;
            loc.c = '=' === c || '#' === c ? '#' : '=';
            loc.r = Math.floor(Math.min(255, loc.r + this.color[0] * dim));
            loc.g = Math.floor(Math.min(255, loc.g + this.color[1] * dim));
            loc.b = Math.floor(Math.min(255, loc.b + this.color[2] * dim));
          }
        }
      }
    }
    return out;
  };

  return Cube;

})(Shape);

Shape.Cube.xx = function(yy) {
  var M;
  M = '/shapelydee/src/Shape/Cube.litcoffee Shape.Cube.xx()\n  ';
  return yy = oo.vArg(M, yy, 'yy <number>', 123);
};

oo.lock(ShapelyDee);

oo.lock(Shape);

oo.lock(Shape.Cube);

oo.lock(Pixel);

if (oo.F === typeof define && define.amd) {
  define(function() {
    return ShapelyDee;
  });
} else if (oo.O === typeof module && module && module.exports) {
  module.exports = ShapelyDee;
} else {
  oo.G.ShapelyDee = ShapelyDee;
}
}).call(this,this);
// Example vendor file. 
