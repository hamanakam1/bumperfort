program test_tilt
  use precision_mod, only: wp
  use telemetry_mod
  use coarray_mod
  implicit none

  call clear_tilt()
  call update_telemetry(0.5_wp, 0.5_wp, 40.0_wp)
  if (check_tilt_status()) error stop "false positive TILT"

  call update_telemetry(0.99_wp, 0.5_wp, 40.0_wp)
  if (.not. check_tilt_status()) error stop "missed TILT"

  print *, "test_tilt PASSED"
end program test_tilt
