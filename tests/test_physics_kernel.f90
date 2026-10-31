program test_physics_kernel
  use precision_mod, only: wp
  use physics_mod
  implicit none
  real(wp) :: q(4), d(4)
  q = 1.0_wp; d = 0.5_wp
  print *, fused_cosine(q,d)
end program test_physics_kernel
