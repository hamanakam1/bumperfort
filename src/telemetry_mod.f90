module telemetry_mod
  use precision_mod
  use coarray_mod
  use ringbuf_mod
  implicit none
  private
  public :: update_telemetry, check_tilt_status

contains

  subroutine update_telemetry(cpu_util, mem_util, temperature)
    real(wp), intent(in) :: cpu_util, mem_util, temperature
    if (cpu_util > tilt_cpu .or. mem_util > tilt_mem .or. temperature > tilt_temp) then
      call raise_tilt()
    end if
  end subroutine update_telemetry

  subroutine check_nan_tilt(vec)
    real(wp), intent(in) :: vec(:)
    integer :: i
    do i = 1, size(vec)
      if (vec(i) /= vec(i)) then
        call rb_push("TILT: NaN detected")
        call raise_tilt()
        return
      end if
    end do
  end subroutine check_nan_tilt

  function check_tilt_status() result(is_tilted)
    logical :: is_tilted
    is_tilted = is_tilt()
  end function check_tilt_status

end module telemetry_mod
