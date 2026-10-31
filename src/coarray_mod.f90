module coarray_mod
  use precision_mod
  implicit none
  private

  logical, public :: tilt_flag[*] = .false.
  real(wp), public :: tilt_cpu  = default_tilt_cpu
  real(wp), public :: tilt_mem  = default_tilt_mem
  real(wp), public :: tilt_temp = default_tilt_temp

  public :: raise_tilt, clear_tilt, is_tilt, set_thresholds

contains

  subroutine raise_tilt()
    tilt_flag = .true.
    sync all
  end subroutine raise_tilt

  subroutine clear_tilt()
    tilt_flag = .false.
    sync all
  end subroutine clear_tilt

  pure function is_tilt() result(t)
    logical :: t
    t = tilt_flag
  end function is_tilt

  subroutine set_thresholds(cpu, mem, temp)
    real(wp), intent(in) :: cpu, mem, temp
    tilt_cpu  = cpu
    tilt_mem  = mem
    tilt_temp = temp
  end subroutine set_thresholds

end module coarray_mod
