module mesh_mod
  implicit none
  private
  public :: mesh_ticket_t, dirty_bit
  type, bind(C) :: mesh_ticket_t
    integer(8) :: seq
    integer(4) :: dirty
    real(8)   :: coord(3)
  end type mesh_ticket_t
  integer, public :: dirty_bit = 0
end module mesh_mod
