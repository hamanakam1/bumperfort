program test_index
  use precision_mod, only: wp
  use physics_mod, only: fused_cosine
  use index_mod, only: top_k_cosine
  implicit none
  real(wp) :: q(4), docs(4,3), scores(2)
  integer :: idx(2)
  q = 1.0
  docs(:,1) = [1,0,0,0]
  docs(:,2) = [0,1,0,0]
  docs(:,3) = [0,0,1,0]
  call top_k_cosine(q, docs, 2, scores, idx)
  if (idx(1) /= 1) error stop "top-k fail"
  print *, "test_index PASSED"
end program test_index
