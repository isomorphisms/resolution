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
    <(-1.2427)*cos(pi*clock)+(0.0133)*sin(pi*clock), (1.3507)*cos(pi*clock)+(0.0284)*sin(pi*clock), (0.8456)*cos(pi*clock)+(-0.7093)*sin(pi*clock), (0.6593)*cos(pi*clock)+(0.1348)*sin(pi*clock), (-0.7039)*cos(pi*clock)+(-1.7566)*sin(pi*clock), (0.3213)*cos(pi*clock)+(0.3989)*sin(pi*clock), (0.3553)*cos(pi*clock)+(0.7009)*sin(pi*clock), (-0.1183)*cos(pi*clock)+(0.1059)*sin(pi*clock), (0.0921)*cos(pi*clock)+(-0.1922)*sin(pi*clock), (1.0923)*cos(pi*clock)+(-0.7892)*sin(pi*clock), (-0.4307)*cos(pi*clock)+(-0.4747)*sin(pi*clock), (0.3533)*cos(pi*clock)+(0.1954)*sin(pi*clock), (0.1991)*cos(pi*clock)+(1.3343)*sin(pi*clock), (-0.2338)*cos(pi*clock)+(0.6924)*sin(pi*clock), (-1.4530)*cos(pi*clock)+(-0.4346)*sin(pi*clock), (0.1181)*cos(pi*clock)+(-0.6537)*sin(pi*clock), (1.5808)*cos(pi*clock)+(1.4147)*sin(pi*clock), (1.1216)*cos(pi*clock)+(-1.4200)*sin(pi*clock), (-0.1263)*cos(pi*clock)+(1.7968)*sin(pi*clock), (0.6353)*cos(pi*clock)+(0.0610)*sin(pi*clock)-0.0001>
  }
  cubic {
    <(1.2427)*cos(pi*clock)+(-0.0133)*sin(pi*clock), (-1.3507)*cos(pi*clock)+(-0.0284)*sin(pi*clock), (-0.8456)*cos(pi*clock)+(0.7093)*sin(pi*clock), (-0.6593)*cos(pi*clock)+(-0.1348)*sin(pi*clock), (0.7039)*cos(pi*clock)+(1.7566)*sin(pi*clock), (-0.3213)*cos(pi*clock)+(-0.3989)*sin(pi*clock), (-0.3553)*cos(pi*clock)+(-0.7009)*sin(pi*clock), (0.1183)*cos(pi*clock)+(-0.1059)*sin(pi*clock), (-0.0921)*cos(pi*clock)+(0.1922)*sin(pi*clock), (-1.0923)*cos(pi*clock)+(0.7892)*sin(pi*clock), (0.4307)*cos(pi*clock)+(0.4747)*sin(pi*clock), (-0.3533)*cos(pi*clock)+(-0.1954)*sin(pi*clock), (-0.1991)*cos(pi*clock)+(-1.3343)*sin(pi*clock), (0.2338)*cos(pi*clock)+(-0.6924)*sin(pi*clock), (1.4530)*cos(pi*clock)+(0.4346)*sin(pi*clock), (-0.1181)*cos(pi*clock)+(0.6537)*sin(pi*clock), (-1.5808)*cos(pi*clock)+(-1.4147)*sin(pi*clock), (-1.1216)*cos(pi*clock)+(1.4200)*sin(pi*clock), (0.1263)*cos(pi*clock)+(-1.7968)*sin(pi*clock), (-0.6353)*cos(pi*clock)+(-0.0610)*sin(pi*clock)-0.0001>
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
