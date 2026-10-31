program test_bounce
  use bounce_mod
  implicit none
  real(8) :: v(4), b(4,1), o(4), o2(4)
  integer :: i
  v = [1.0d0, 2.0d0, 3.0d0, 4.0d0]
  b = reshape([1.0d0,0.0d0,0.0d0,0.0d0],[4,1])
  call bounce_trajectory(v, b, o)
  call bounce_trajectory(v, b, o2)
  do i = 1, 4
    if (o(i) /= o2(i)) then
      print *, 'NON-DETERMINISTIC'
      stop 1
    end if
  end do
  print *, 'deterministic OK'
end program test_bounce
