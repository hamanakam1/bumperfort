module shm_mod
  use iso_c_binding
  implicit none
  type, bind(C) :: shm_ticket_t
    integer(c_int64_t) :: seq
    integer(c_int)     :: dirty
    real(c_double)     :: coord(3)
  end type shm_ticket_t
end module shm_mod
