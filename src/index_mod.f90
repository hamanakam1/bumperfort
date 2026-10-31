module index_mod
  use precision_mod, only: wp
  use physics_mod, only: fused_cosine
  implicit none
  private
  public :: top_k_cosine

contains

  pure subroutine top_k_cosine(query, docs, k, scores_out, indices_out)
    real(wp), intent(in)  :: query(:)
    real(wp), intent(in)  :: docs(:,:)
    integer,  intent(in)  :: k
    real(wp), intent(out) :: scores_out(k)
    integer,  intent(out) :: indices_out(k)

    integer :: n_docs, j, m, insert_at
    real(wp) :: score
    real(wp), allocatable :: all_scores(:)

    n_docs = size(docs, 2)
    allocate(all_scores(n_docs))

    do concurrent (j = 1:n_docs)
      all_scores(j) = fused_cosine(query, docs(:, j))
    end do

    scores_out  = -huge(1.0_wp)
    indices_out = 0

    do j = 1, n_docs
      score = all_scores(j)
      if (score > scores_out(k)) then
        insert_at = k
        do m = 1, k
          if (score > scores_out(m)) then
            insert_at = m
            exit
          end if
        end do
        if (insert_at < k) then
          scores_out(insert_at+1:k)  = scores_out(insert_at:k-1)
          indices_out(insert_at+1:k) = indices_out(insert_at:k-1)
        end if
        scores_out(insert_at)  = score
        indices_out(insert_at) = j
      end if
    end do

    deallocate(all_scores)
  end subroutine top_k_cosine

end module index_mod
