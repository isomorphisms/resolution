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
    <(-0.1434)*cos(pi*clock)+(2.8190)*sin(pi*clock), (-0.9222)*cos(pi*clock)+(1.1931)*sin(pi*clock), (-0.0458)*cos(pi*clock)+(-0.8651)*sin(pi*clock), (-0.7110)*cos(pi*clock)+(0.3818)*sin(pi*clock), (-0.3528)*cos(pi*clock)+(0.0717)*sin(pi*clock), (-1.4111)*cos(pi*clock)+(0.1138)*sin(pi*clock), (-0.0843)*cos(pi*clock)+(1.3837)*sin(pi*clock), (-0.7653)*cos(pi*clock)+(0.7898)*sin(pi*clock), (-1.4874)*cos(pi*clock)+(2.0181)*sin(pi*clock), (-0.1771)*cos(pi*clock)+(1.0769)*sin(pi*clock), (-0.0621)*cos(pi*clock)+(2.0609)*sin(pi*clock), (-1.5301)*cos(pi*clock)+(-0.5808)*sin(pi*clock), (1.4417)*cos(pi*clock)+(0.1789)*sin(pi*clock), (0.0543)*cos(pi*clock)+(-2.2525)*sin(pi*clock), (-1.0865)*cos(pi*clock)+(-0.3121)*sin(pi*clock), (-0.4986)*cos(pi*clock)+(-1.3204)*sin(pi*clock), (0.0519)*cos(pi*clock)+(-0.5292)*sin(pi*clock), (0.3836)*cos(pi*clock)+(-0.7199)*sin(pi*clock), (1.0328)*cos(pi*clock)+(-0.6864)*sin(pi*clock), (-1.1020)*cos(pi*clock)+(0.0371)*sin(pi*clock)-0.0001>
  }
  cubic {
    <(0.1434)*cos(pi*clock)+(-2.8190)*sin(pi*clock), (0.9222)*cos(pi*clock)+(-1.1931)*sin(pi*clock), (0.0458)*cos(pi*clock)+(0.8651)*sin(pi*clock), (0.7110)*cos(pi*clock)+(-0.3818)*sin(pi*clock), (0.3528)*cos(pi*clock)+(-0.0717)*sin(pi*clock), (1.4111)*cos(pi*clock)+(-0.1138)*sin(pi*clock), (0.0843)*cos(pi*clock)+(-1.3837)*sin(pi*clock), (0.7653)*cos(pi*clock)+(-0.7898)*sin(pi*clock), (1.4874)*cos(pi*clock)+(-2.0181)*sin(pi*clock), (0.1771)*cos(pi*clock)+(-1.0769)*sin(pi*clock), (0.0621)*cos(pi*clock)+(-2.0609)*sin(pi*clock), (1.5301)*cos(pi*clock)+(0.5808)*sin(pi*clock), (-1.4417)*cos(pi*clock)+(-0.1789)*sin(pi*clock), (-0.0543)*cos(pi*clock)+(2.2525)*sin(pi*clock), (1.0865)*cos(pi*clock)+(0.3121)*sin(pi*clock), (0.4986)*cos(pi*clock)+(1.3204)*sin(pi*clock), (-0.0519)*cos(pi*clock)+(0.5292)*sin(pi*clock), (-0.3836)*cos(pi*clock)+(0.7199)*sin(pi*clock), (-1.0328)*cos(pi*clock)+(0.6864)*sin(pi*clock), (1.1020)*cos(pi*clock)+(-0.0371)*sin(pi*clock)-0.0001>
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
