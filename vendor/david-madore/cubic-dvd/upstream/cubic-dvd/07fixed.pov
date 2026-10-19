// Camera

camera {
  location <0, 5, -20>
  look_at <0, 0, 0>
  angle 30
}

// The surface itself

// An isolated singularity of type A2 (binode of order 3 in Cayley's terminology),
// where the two planes are complex conjugates (rotation of a cusp)

intersection {
  cubic {
    <0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, -0.0001>
  }
  cubic {
    <0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, -0.0001>
  }
  sphere {
    <0, 0, 0>, 4
  }
//  rotate <0, 360*clock, 0>
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
