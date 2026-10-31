program batch_demo
  use precision_mod, only: wp
  use physics_mod
  implicit none
  real(wp) :: q(4), docs(4,5), scores(5)
  integer :: i
  q = 1.0_wp
  do i = 1, 5
    docs(:,i) = 0.0_wp
    docs(1,i) = real(i, wp) * 0.1_wp
  end do
  call batch_cosine(q, docs, scores)
  do i = 1, 5
    print *, "doc", i, "score", scores(i)
  end do
end program batch_demo
