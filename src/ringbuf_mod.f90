module ringbuf_mod
  implicit none
  private
  integer, parameter :: RBSIZE = 1024
  character(len=128), public :: rb(RBSIZE)
  integer, public :: rb_head = 0
  public :: rb_push
contains
  subroutine rb_push(msg)
    character(*), intent(in) :: msg
    rb_head = mod(rb_head, RBSIZE) + 1
    rb(rb_head) = msg
  end subroutine rb_push
end module ringbuf_mod
