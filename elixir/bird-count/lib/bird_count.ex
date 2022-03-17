defmodule BirdCount do
  def today([]), do: nil
  def today([today | _]), do: today
  
  def increment_day_count([]), do: [1]  
  def increment_day_count([today | list]), do: [today + 1] ++ list

  def has_day_without_birds?(list), do: Enum.any?(list, & &1 == 0)

  def total([]), do: 0
  def total(list), do: Enum.reduce(list, fn day, acc -> day + acc end)

  def busy_days([]), do: 0
  def busy_days(list), do: Enum.count(list, & &1 >= 5)
end
