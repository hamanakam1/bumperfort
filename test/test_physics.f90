module test_physics
  use precision_mod
  use physics_mod
  implicit none
contains
  subroutine run_tests()
    real(wp) :: a(3), b(3)
    a = [1.0, 0.0, 0.0]
    b = [1.0, 0.0, 0.0]
    if (abs(cosine_similarity(a,b) - 1.0) > 1e-6) error stop "cosine fail"
    print *, "physics tests passed"
  end subroutine run_tests
end module test_physics

program test_physics_driver
  use test_physics
  call run_tests()
end program test_physics_driver
