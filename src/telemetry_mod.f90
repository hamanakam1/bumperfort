module telemetry_mod
  use precision_mod, only: wp, default_tilt_cpu, default_tilt_mem, default_tilt_temp
  use coarray_mod, only: tilt_flag, tilt_cpu, tilt_mem, tilt_temp, raise_tilt
  implicit none
  private

  public :: tilt_monitor_step, tilt_check, tilt_reset

contains

  subroutine tilt_monitor_step(cpu_load, mem_load, temp_c)
    real(wp), intent(in) :: cpu_load, mem_load, temp_c
    if (cpu_load >= tilt_cpu .or. mem_load >= tilt_mem .or. temp_c >= tilt_temp) then
      call raise_tilt()
    end if
  end subroutine tilt_monitor_step

  pure function tilt_check(cpu_load, mem_load, temp_c) result(tilted)
    real(wp), intent(in) :: cpu_load, mem_load, temp_c
    logical :: tilted
    tilted = (cpu_load >= tilt_cpu) .or. (mem_load >= tilt_mem) .or. (temp_c >= tilt_temp)
  end function tilt_check

  subroutine tilt_reset()
    tilt_flag = .false.
    sync all
  end subroutine tilt_reset

end module telemetry_mod
