program mesh_demo
  use shm_mod
  implicit none
  type(shm_ticket_t) :: t
  t%seq = 42
  print *, "seq", t%seq
end program mesh_demo
