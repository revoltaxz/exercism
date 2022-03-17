defmodule KitchenCalculator do
  @metrics_from_ml %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume({_type, quantity}), do: quantity

  def to_milliliter({type, quantity}) do
    {:milliliter, @metrics_from_ml[type] * quantity}
  end

  def from_milliliter(milliliter_values, unit) do
    convert(milliliter_values, unit)
  end

  def convert(from_values, unit) do
    {_, ml_quantity} = to_milliliter(from_values)

    {unit, ml_quantity / @metrics_from_ml[unit]}
  end
end
