module bounce_mod
  use, intrinsic :: iso_fortran_env, only: real64
  implicit none
  private
  public :: bounce_trajectory, batch_bounce

  real(real64), parameter :: eps = 1.0e-12_real64

contains

  pure subroutine bounce_trajectory(vec, boundary, out)
    real(real64), intent(in)  :: vec(:)
    real(real64), intent(in)  :: boundary(:,:)
    real(real64), intent(out) :: out(:)
    real(real64) :: nrm, bnorm, cosval, scale
    integer :: d, m

    d = size(vec)
    m = size(boundary, 2)
    out = vec
    do concurrent (j = 1:m)
      cosval = dot_product(vec, boundary(:, j))
      bnorm  = sqrt(dot_product(boundary(:, j), boundary(:, j)))
      nrm    = sqrt(dot_product(vec, vec))
      if (nrm > eps .and. bnorm > eps) then
        scale = cosval / (nrm * bnorm)
        out   = out - 2.0_real64 * scale * boundary(:, j)
      end if
    end do
  end subroutine bounce_trajectory

  pure subroutine batch_bounce(vecs, boundary, out)
    real(real64), intent(in)  :: vecs(:,:)
    real(real64), intent(in)  :: boundary(:,:)
    real(real64), intent(out) :: out(:,:)
    integer :: i, n
    n = size(vecs, 2)
    do concurrent (i = 1:n)
      call bounce_trajectory(vecs(:, i), boundary, out(:, i))
    end do
  end subroutine batch_bounce

end module bounce_mod
