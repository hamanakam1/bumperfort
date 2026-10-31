program single_query
  use precision_mod, only: wp
  use physics_mod
  implicit none
  real(wp) :: q(8), d(8)
  q = 1.0_wp
  d = 0.5_wp
  print *, "cosine = ", fused_cosine(q, d)
end program single_query
