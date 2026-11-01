module rom_mod
  use precision_mod, only: wp
  implicit none
  private
  public :: playfield_A, playfield_B, active_pf, load_new_rom
  real(wp), target :: playfield_A(768,1024), playfield_B(768,1024)
  real(wp), pointer :: active_pf(:,:) => playfield_A
  integer :: hot_swaps = 0
contains
  subroutine load_new_rom(ptr, checksum) bind(C, name="load_new_rom")
    use iso_c_binding
    type(c_ptr), value :: ptr
    integer(c_int64_t), value :: checksum
    real(wp), pointer :: standby(:,:)
    if (associated(active_pf, playfield_A)) then
      standby => playfield_B
    else
      standby => playfield_A
    end if
    ! copy not implemented; pointer swap only
    active_pf => standby
    hot_swaps = hot_swaps + 1
  end subroutine load_new_rom
end module rom_mod
