# FFI Explained: Zero-Copy Interop

## Why ISO_C_BINDING

Fortran's default arrays are not C arrays. To share memory with C (and therefore Python/Rust/Go), we use `iso_c_binding` to map types and `bind(C)` to expose symbols with C linkage.

## Key Concepts

- `bind(C, name="...")` makes a Fortran procedure callable from C with the given symbol name.
- `c_ptr` is the Fortran representation of a C `void*`.
- `c_f_pointer(ptr, farray, shape)` associates a Fortran pointer with a C memory block without copying.
- `c_loc(x)` returns the address of a Fortran variable.
- `c_associated(ptr)` checks for null.

## Zero-Copy Rule

We never copy the data. The caller (Python/Rust) owns a contiguous buffer; Fortran receives a pointer + length and operates in place.

## Walk-through: bumper_cosine_c

```fortran
function bumper_cosine_c(a_ptr, b_ptr, n) result(score) &
     bind(C, name="bumper_cosine")
  type(c_ptr), value, intent(in) :: a_ptr, b_ptr
  integer(c_size_t), value, intent(in) :: n
  real(c_wp) :: score
  real(wp), pointer :: a(:), b(:)

  if (c_associated(a_ptr) .and. c_associated(b_ptr) .and. n > 0) then
    call c_f_pointer(a_ptr, a, [n])
    call c_f_pointer(b_ptr, b, [n])
    score = real(fused_cosine(a, b), kind=c_wp)
  else
    score = 0.0_c_wp
  end if
end function
```

Steps:
1. Receive two `c_ptr` (pointers) and a length `n`.
2. Null-check and size-check (safety).
3. `c_f_pointer` wraps each pointer as a Fortran assumed-size array view — no copy.
4. Call the pure kernel `fused_cosine`.
5. Return the scalar.

## Walk-through: bumper_batch_cosine_c

Same idea but for a 2D docs matrix. `c_f_pointer(docs_ptr, docs, [dim, n_docs])` gives a `(dim, n_docs)` view over the caller's contiguous memory. Fortran's column-major layout means the caller must store docs as columns (dim rows, n_docs columns) — document this in the C header.

## Caller Contract (Python)

```python
import numpy as np, ctypes
a = np.ascontiguousarray(vec, dtype=np.float32)
lib.bumper_cosine(a.ctypes.data_as(ctypes.POINTER(ctypes.c_float)), ...)
```

The array must be contiguous and the dtype must match `wp` (float32 by default).

## Safety Rules

- Always null-check pointers.
- Always check `n > 0`.
- Never dereference a pointer Fortran did not allocate without a known size.
- Keep kernels pure; only the thin FFI wrapper touches pointers.
- Document the memory layout (column-major) for batch calls.
