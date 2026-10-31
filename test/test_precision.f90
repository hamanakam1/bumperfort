program test_precision
  use precision_mod, only: wp, c_wp
  implicit none
  if (wp /= 4 .and. wp /= 8) error stop "bad wp"
  print *, "test_precision PASSED (wp =", wp, ")"
end program test_precision
