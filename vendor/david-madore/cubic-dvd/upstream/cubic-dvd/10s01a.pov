// Camera

camera {
  location <0, 5, -20>
  look_at <0, 0, 0>
  angle 30
}

// The surface itself

// An isolated singularities of type D4 (unode of order 6 in Cayley's terminology).

intersection {
  cubic {
    <-1, 0, 0, 3*cos(2*pi*clock), 0, 0, 0, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3*cos(2*pi*clock), 0, -4*cos(2*pi*clock)*cos(2*pi*clock)*cos(2*pi*clock)-0.0001>
  }
  cubic {
    <1, 0, 0, -3*cos(2*pi*clock), 0, 0, 0, -3, 0, 0, 0, 0, -1, 0, 0, 0, 0, -3*cos(2*pi*clock), 0, 4*cos(2*pi*clock)*cos(2*pi*clock)*cos(2*pi*clock)-0.0001>
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
