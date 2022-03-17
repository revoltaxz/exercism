defmodule Rules do
  def eat_ghost?(true, true), do: true
  def eat_ghost?(_power_pellet_active, _touching_ghost), do: false

  def score?(true, _touching_dot), do: true
  def score?(_touching_power_pellet, true), do: true
  def score?(_touching_power_pellet, _touching_dot), do: false

  def lose?(false, true), do: true
  def lose?(true, _touching_ghost), do: false
  def lose?(_power_pellet_active, _touching_ghost), do: false

  def win?(false, _, _), do: false

  def win?(_has_eaten_all_dots, power_pellet_active, touching_ghost) do
    power_pellet_active
    |> lose?(touching_ghost)
    |> handle_win_response()
  end

  defp handle_win_response(true), do: false
  defp handle_win_response(false), do: true
end
