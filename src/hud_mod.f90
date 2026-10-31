module hud_mod
  implicit none
  private
  public :: hud_render
contains
  subroutine hud_render(bounces, balls, tilted)
    integer, intent(in) :: bounces, balls
    logical, intent(in) :: tilted
    character(len=*), parameter :: ESC = achar(27)
    write(*,'(A)') ESC//"[2J"//ESC//"[H"
    write(*,'(A)') "[ TABLE ACTIVE | DIMENSIONS: 768 | FFI: ZERO-COPY BOUND | TICKETS DISPENSED: 0 | MESH SYNC: OFFLINE ]"
    write(*,'(A,I0,A,I0)') "Playfield: bounces=", bounces, " balls=", balls
    if (tilted) then
      write(*,'(A)') ESC//"[31mTILT: ENGAGED"//ESC//"[0m"
    else
      write(*,'(A)') ESC//"[32mTILT: CLEAR"//ESC//"[0m"
    end if
  end subroutine hud_render
end module hud_mod
