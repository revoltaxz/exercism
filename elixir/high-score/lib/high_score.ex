defmodule HighScore do
  @default_value 0

  def new(), do: %{}

  def add_player(scores, name, score \\ 0), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.put(scores, name, @default_value)

  def update_score(scores, name, score) do
    Map.update(scores, name, score, & &1 + score)
  end

  def get_players(scores), do: Map.keys(scores)
end
