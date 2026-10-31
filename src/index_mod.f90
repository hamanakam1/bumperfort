module index_mod
  use precision_mod, only: wp
  implicit none
  private

  public :: top_k_indices

contains

  subroutine top_k_indices(scores, k, indices)
    real(wp), intent(in) :: scores(:)
    integer, intent(in) :: k
    integer, intent(out) :: indices(:)
    integer :: n, i, j, tmp_idx
    real(wp) :: tmp_val
    integer, allocatable :: order(:)
    real(wp), allocatable :: work(:)

    n = size(scores)
    if (k <= 0 .or. n == 0) return
    allocate(order(n), work(n))
    do i = 1, n
      order(i) = i
      work(i) = scores(i)
    end do
    ! simple selection sort for top-k
    do i = 1, min(k, n)
      tmp_idx = i
      tmp_val = work(i)
      do j = i+1, n
        if (work(j) > tmp_val) then
          tmp_val = work(j)
          tmp_idx = j
        end if
      end do
      if (tmp_idx /= i) then
        work(tmp_idx) = work(i)
        work(i) = tmp_val
        tmp_idx = order(tmp_idx)
        order(tmp_idx) = order(i)
        order(i) = tmp_idx
      end if
    end do
    do i = 1, min(k, n)
      indices(i) = order(i)
    end do
    deallocate(order, work)
  end subroutine top_k_indices

end module index_mod
