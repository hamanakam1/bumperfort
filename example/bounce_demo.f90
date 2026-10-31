program bounce_demo
  use bounce_mod
  implicit none
  real(8) :: v(4), b(4,1), o(4)
  v = [1.0d0, 2.0d0, 3.0d0, 4.0d0]
  b = reshape([1.0d0,0.0d0,0.0d0,0.0d0],[4,1])
  call bounce_trajectory(v, b, o)
  print *, "bounced:", o
end program bounce_demo
