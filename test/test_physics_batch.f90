program test_physics_batch
  use precision_mod, only: wp
  use physics_mod
  implicit none
  real(wp) :: q(4), docs(4,3), scores(3)
  q = 1.0_wp
  docs(:,1) = [1.0,0,0,0]
  docs(:,2) = [0,1,0,0]
  docs(:,3) = [0,0,1,0]
  call batch_cosine(q, docs, scores)
  if (scores(1) < 0.5) error stop "batch fail"
  print *, "test_physics_batch PASSED"
end program test_physics_batch
