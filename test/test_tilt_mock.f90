program test_tilt_mock
  use precision_mod, only: wp
  use telemetry_mod
  use coarray_mod
  implicit none
  real(wp) :: bad(4)
  bad = 0.0_wp
  bad(1) = 0.0_wp / 0.0_wp  ! NaN
  call clear_tilt()
  call check_nan_tilt(bad)
  print *, "tilt triggered:", check_tilt_status()
end program test_tilt_mock
