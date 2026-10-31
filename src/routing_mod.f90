module routing_mod
  implicit none
  private
  public :: route_intent
contains
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
