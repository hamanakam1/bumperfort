program test_shm
  use shm_mod
  implicit none
  type(shm_ticket_t) :: t
  t%seq = 1
  print *, t%seq
end program test_shm
