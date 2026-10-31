module physics_mod
  use precision_mod, only: wp, eps_norm
  implicit none
  private

  public :: dot_product_f, norm2_f, cosine_similarity
  public :: batch_cosine, batch_cosine_blocked
  public :: fused_cosine

contains

  pure function dot_product_f(a, b) result(d)
    real(wp), intent(in) :: a(:), b(:)
    real(wp) :: d
    integer :: i, n
    n = size(a)
    d = 0.0_wp
    do concurrent (i = 1:n)
      d = d + a(i)*b(i)
    end do
  end function dot_product_f

  pure function norm2_f(a) result(n)
    real(wp), intent(in) :: a(:)
    real(wp) :: n
    n = sqrt(max(dot_product_f(a, a), 0.0_wp))
  end function norm2_f

  pure function cosine_similarity(a, b) result(c)
    real(wp), intent(in) :: a(:), b(:)
    real(wp) :: c, na, nb, d
    d  = dot_product_f(a, b)
    na = norm2_f(a)
    nb = norm2_f(b)
    if (na < eps_norm .or. nb < eps_norm) then
      c = 0.0_wp
    else
      c = d / (na * nb)
    end if
  end function cosine_similarity

  pure function fused_cosine(a, b) result(c)
    real(wp), intent(in) :: a(:), b(:)
    real(wp) :: c, d, na2, nb2
    integer :: i, n
    n = size(a)
    d = 0.0_wp; na2 = 0.0_wp; nb2 = 0.0_wp
    do concurrent (i = 1:n)
      d   = d   + a(i)*b(i)
      na2 = na2 + a(i)*a(i)
      nb2 = nb2 + b(i)*b(i)
    end do
    if (na2 < eps_norm*eps_norm .or. nb2 < eps_norm*eps_norm) then
      c = 0.0_wp
    else
      c = d / (sqrt(na2) * sqrt(nb2))
    end if
  end function fused_cosine

  pure subroutine batch_cosine(query, docs, scores)
    real(wp), intent(in)  :: query(:)
    real(wp), intent(in)  :: docs(:,:)
    real(wp), intent(out) :: scores(:)
    integer :: j, n_docs
    n_docs = size(docs, 2)
    do concurrent (j = 1:n_docs)
      scores(j) = fused_cosine(query, docs(:, j))
    end do
  end subroutine batch_cosine

  pure subroutine batch_cosine_blocked(query, docs, scores, block_size)
    real(wp), intent(in)  :: query(:)
    real(wp), intent(in)  :: docs(:,:)
    real(wp), intent(out) :: scores(:)
    integer, intent(in)   :: block_size
    integer :: j, j0, j1, n_docs
    n_docs = size(docs, 2)
    do j0 = 1, n_docs, block_size
      j1 = min(j0 + block_size - 1, n_docs)
      do concurrent (j = j0:j1)
        scores(j) = fused_cosine(query, docs(:, j))
      end do
    end do
  end subroutine batch_cosine_blocked

end module physics_mod
