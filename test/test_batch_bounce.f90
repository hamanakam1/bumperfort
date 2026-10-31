program test_batch_bounce
  use bounce_mod
  implicit none
  real(8) :: vecs(4,3), b(4,1), out(4,3)
  vecs = 1.0d0
  b = reshape([1.0d0,0.0d0,0.0d0,0.0d0],[4,1])
  call batch_bounce(vecs, b, out)
  print *, "batch ok", out(1,1)
end program test_batch_bounce
