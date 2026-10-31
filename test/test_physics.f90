program test_physics
  use precision_mod, only: wp
  use physics_mod
  implicit none

  real(wp) :: a(4), b(4), c
  a = [1.0_wp, 0.0_wp, 0.0_wp, 0.0_wp]
  b = [1.0_wp, 0.0_wp, 0.0_wp, 0.0_wp]
  c = fused_cosine(a, b)

  if (abs(c - 1.0_wp) > 1.0e-6_wp) then
    error stop "test_physics failed: expected cosine ~ 1.0"
  end if
  print *, "test_physics PASSED"
end program test_physics
