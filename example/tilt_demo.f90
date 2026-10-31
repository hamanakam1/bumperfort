program tilt_demo
  use precision_mod, only: wp
  use telemetry_mod
  use coarray_mod
  implicit none
  call clear_tilt()
  call update_telemetry(0.3_wp, 0.4_wp, 50.0_wp)
  print *, "tilt after normal:", check_tilt_status()
  call update_telemetry(0.99_wp, 0.4_wp, 50.0_wp)
  print *, "tilt after overload:", check_tilt_status()
end program tilt_demo
