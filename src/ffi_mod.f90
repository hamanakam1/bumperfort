module ffi_mod
  use precision_mod
  use physics_mod
  implicit none
  private

  type, bind(C), public :: plunger_payload_t
    integer(c_size_t) :: dim
    type(c_ptr)       :: data
  end type plunger_payload_t

  public :: bumper_cosine_c
  public :: bumper_batch_cosine_c
  public :: bumper_version_c

contains

  function bumper_cosine_c(a_ptr, b_ptr, n) result(score) &
       bind(C, name="bumper_cosine")
    type(c_ptr),        value, intent(in) :: a_ptr, b_ptr
    integer(c_size_t),  value, intent(in) :: n
    real(c_wp) :: score
    real(wp), pointer :: a(:), b(:)

    if (.not. c_associated(a_ptr)) then
      write(*,'(A)') 'bumperfort: null pointer a_ptr'
      score = 0.0_c_wp
      return
    end if
    if (.not. c_associated(b_ptr)) then
      write(*,'(A)') 'bumperfort: null pointer b_ptr'
      score = 0.0_c_wp
      return
    end if
    if (n == 0) then
      write(*,'(A)') 'bumperfort: zero dimension'
      score = 0.0_c_wp
      return
    end if
    if (c_associated(a_ptr) .and. c_associated(b_ptr) .and. n > 0) then
      call c_f_pointer(a_ptr, a, [n])
      call c_f_pointer(b_ptr, b, [n])
      score = real(fused_cosine(a, b), kind=c_wp)
    else
      score = 0.0_c_wp
    end if
  end function bumper_cosine_c

  subroutine bumper_batch_cosine_c(query_ptr, docs_ptr, dim, n_docs, scores_ptr) &
       bind(C, name="bumper_batch_cosine")
    type(c_ptr),       value, intent(in) :: query_ptr, docs_ptr, scores_ptr
    integer(c_size_t), value, intent(in) :: dim, n_docs
    real(wp), pointer :: query(:), docs(:,:), scores(:)

    if (.not. (c_associated(query_ptr) .and. c_associated(docs_ptr) .and. &
               c_associated(scores_ptr))) return
    if (dim == 0 .or. n_docs == 0) return

    call c_f_pointer(query_ptr, query, [dim])
    call c_f_pointer(docs_ptr,  docs,  [dim, n_docs])
    call c_f_pointer(scores_ptr, scores, [n_docs])
    call batch_cosine(query, docs, scores)
  end subroutine bumper_batch_cosine_c

  subroutine bumper_version_c(major, minor, patch) bind(C, name="bumper_version")
    integer(c_int), intent(out) :: major, minor, patch
    major = 0; minor = 1; patch = 0
  end subroutine bumper_version_c

end module ffi_mod
