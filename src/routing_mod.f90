module routing_mod
  implicit none
  private
  public :: route_intent
  public :: classify_region
contains

  pure function classify_region(x,y) result(r)
    real(8), intent(in) :: x,y
    integer :: r
    if (x > 0 .and. y > 0) then; r=1
    elseif (x <= 0 .and. y > 0) then; r=2
    else; r=3
    end if
  end function classify_region
  subroutine route_intent(region, model, stack)
    integer, intent(in) :: region
    character(*), intent(out) :: model, stack
    select case (region)
    case (1)
      model = "Qwen3.6"; stack = "MLX"
    case (2)
      model = "CrewAI"; stack = "Ollama"
    case default
      model = "Qwen3.6"; stack = "MLX"
    end select
  end subroutine route_intent
end module routing_mod
