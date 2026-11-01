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
    write(*,'(A)') "[ TABLE ACTIVE | DIMENSIONS: 768 | FFI: ZERO-COPY BOUND | MATH BACKEND: FORTRAN KERNELS | CACHE ALIGNMENT: 64-BYTE ]"
    write(*,'(A)') "[ LAST INTENT: PORTAL-UI | ROUTING: QWEN3.6 (MLX) | BOUNCES: 4 ]
    write(*,'(A)') "[ ACTIVE ROM: PLAYFIELD_A | CHECKSUM: 8f4e2a... | HOT-SWAPS: 0 ]""
    write(*,'(A,I0,A,I0)') "[ PLAYFIELD: BOUNCES=", bounces, " | BALLS=", balls, " ]"
    if (tilted) then
      write(*,'(A)') ESC//"[31mTILT: ENGAGED"//ESC//"[0m"
    else
      write(*,'(A)') ESC//"[32mTILT: CLEAR"//ESC//"[0m"
    end if
  end subroutine hud_render
end module hud_mod
