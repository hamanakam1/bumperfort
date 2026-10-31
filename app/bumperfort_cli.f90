program bumperfort_cli
  use precision_mod
  use physics_mod
  implicit none
  real(wp) :: a(4), b(4)
  a = [1.0, 2.0, 3.0, 4.0]
  b = [4.0, 3.0, 2.0, 1.0]
  print *, "cosine:", cosine_similarity(a, b)
  print *, "fused: ", fused_cosine(a, b)
end program bumperfort_cli
