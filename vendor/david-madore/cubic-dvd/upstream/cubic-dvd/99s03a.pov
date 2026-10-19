// Camera

camera {
  location <0, 5, -20>
  look_at <0, 0, 0>
  angle 30
}

// The surface itself

// Random!

intersection {
  cubic {
    <(0.4703)*cos(pi*clock)+(0.2846)*sin(pi*clock), (-1.2598)*cos(pi*clock)+(-0.7666)*sin(pi*clock), (-0.2251)*cos(pi*clock)+(-0.8733)*sin(pi*clock), (-0.7690)*cos(pi*clock)+(-0.5768)*sin(pi*clock), (2.2922)*cos(pi*clock)+(1.0367)*sin(pi*clock), (0.0201)*cos(pi*clock)+(-0.1818)*sin(pi*clock), (-1.1038)*cos(pi*clock)+(1.2026)*sin(pi*clock), (1.1234)*cos(pi*clock)+(0.9293)*sin(pi*clock), (-1.3212)*cos(pi*clock)+(0.2248)*sin(pi*clock), (1.6350)*cos(pi*clock)+(0.2895)*sin(pi*clock), (-0.5668)*cos(pi*clock)+(2.4080)*sin(pi*clock), (1.5216)*cos(pi*clock)+(-1.5334)*sin(pi*clock), (1.7163)*cos(pi*clock)+(0.0396)*sin(pi*clock), (0.5519)*cos(pi*clock)+(1.3883)*sin(pi*clock), (0.8810)*cos(pi*clock)+(1.2819)*sin(pi*clock), (-0.0597)*cos(pi*clock)+(0.2213)*sin(pi*clock), (-1.1389)*cos(pi*clock)+(0.3055)*sin(pi*clock), (1.5481)*cos(pi*clock)+(0.4653)*sin(pi*clock), (-0.8015)*cos(pi*clock)+(0.2926)*sin(pi*clock), (-0.5172)*cos(pi*clock)+(0.0991)*sin(pi*clock)-0.0001>
  }
  cubic {
    <(-0.4703)*cos(pi*clock)+(-0.2846)*sin(pi*clock), (1.2598)*cos(pi*clock)+(0.7666)*sin(pi*clock), (0.2251)*cos(pi*clock)+(0.8733)*sin(pi*clock), (0.7690)*cos(pi*clock)+(0.5768)*sin(pi*clock), (-2.2922)*cos(pi*clock)+(-1.0367)*sin(pi*clock), (-0.0201)*cos(pi*clock)+(0.1818)*sin(pi*clock), (1.1038)*cos(pi*clock)+(-1.2026)*sin(pi*clock), (-1.1234)*cos(pi*clock)+(-0.9293)*sin(pi*clock), (1.3212)*cos(pi*clock)+(-0.2248)*sin(pi*clock), (-1.6350)*cos(pi*clock)+(-0.2895)*sin(pi*clock), (0.5668)*cos(pi*clock)+(-2.4080)*sin(pi*clock), (-1.5216)*cos(pi*clock)+(1.5334)*sin(pi*clock), (-1.7163)*cos(pi*clock)+(-0.0396)*sin(pi*clock), (-0.5519)*cos(pi*clock)+(-1.3883)*sin(pi*clock), (-0.8810)*cos(pi*clock)+(-1.2819)*sin(pi*clock), (0.0597)*cos(pi*clock)+(-0.2213)*sin(pi*clock), (1.1389)*cos(pi*clock)+(-0.3055)*sin(pi*clock), (-1.5481)*cos(pi*clock)+(-0.4653)*sin(pi*clock), (0.8015)*cos(pi*clock)+(-0.2926)*sin(pi*clock), (0.5172)*cos(pi*clock)+(-0.0991)*sin(pi*clock)-0.0001>
  }
  sphere {
    <0, 0, 0>, 4
  }
  rotate <0, 20, 0>
  texture {
    pigment { red 1.0 green 1.0 blue 1.0 }
    finish { ambient .2 diffuse .4 phong .3 reflection .2 }
  }
}

// Light sources!

light_source {
  <1000, 2000, -1732>
  rgb <1,0,0>
}

light_source {
  <0, 5000, 0>
  rgb <0,1,0>
}

light_source {
  <-500, -2000, 0>
  rgb <0,0,1>
}
