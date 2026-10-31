module precision_mod
  use, intrinsic :: iso_fortran_env, only: real32, real64, int32, int64, &
                                          compiler_version, compiler_options
  use, intrinsic :: iso_c_binding, only: c_float, c_double, c_int, c_size_t, &
                                         c_ptr, c_loc, c_f_pointer, c_null_ptr, &
                                         c_bool, c_char
  implicit none
  private

  ! ------------------------------------------------------------------
  ! Working precision – change one line to retarget the whole library
  ! ------------------------------------------------------------------
  integer, parameter, public :: wp     = real32
  integer, parameter, public :: c_wp   = c_float   ! MUST match wp

  ! Alternative (uncomment to switch):
  ! integer, parameter, public :: wp   = real64
  ! integer, parameter, public :: c_wp = c_double

  ! Numerical safety
  real(wp), parameter, public :: eps_norm     = 1.0e-8_wp
  real(wp), parameter, public :: eps_zero     = 1.0e-12_wp

  ! Default TILT thresholds (can be overridden at runtime)
  real(wp), parameter, public :: default_tilt_cpu  = 0.92_wp
  real(wp), parameter, public :: default_tilt_mem  = 0.88_wp
  real(wp), parameter, public :: default_tilt_temp = 95.0_wp   ! °C

  ! Re-export common C interop symbols
  public :: c_float, c_double, c_int, c_size_t, c_ptr, c_loc, &
            c_f_pointer, c_null_ptr, c_bool, c_char
  public :: real32, real64, int32, int64
  public :: compiler_version, compiler_options

end module precision_mod
