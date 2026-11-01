program sensors_demo
  use sensors_mod
  implicit none
  print *, "cpu temp", read_cpu_temp()
end program sensors_demo
