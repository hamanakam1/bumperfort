module sensors_mod
  use iso_c_binding
  implicit none
  interface
    function read_cpu_temp() bind(C, name="read_cpu_temp") result(t)
      integer(c_int) :: t
    end function
  end interface
end module sensors_mod
