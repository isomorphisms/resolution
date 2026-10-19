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
    <0.1688, 2.9523, 0.8274, -0.0377, -2.3042, 0.7024, -0.7118, 0.3480, -0.0599, -0.6153, -0.1501, -2.5201, -0.3237, 0.2063, -2.4886, 0.4971, -1.7817, 1.4945, -0.4655, -0.3527-0.0001>
  }
  cubic {
    <-0.1688, -2.9523, -0.8274, 0.0377, 2.3042, -0.7024, 0.7118, -0.3480, 0.0599, 0.6153, 0.1501, 2.5201, 0.3237, -0.2063, 2.4886, -0.4971, 1.7817, -1.4945, 0.4655, 0.3527-0.0001>
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
