defmodule FreelancerRates do

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    get_daily_rate(hourly_rate) * 22
    |> apply_discount(discount) 
    |> ceil()
    |> trunc()
    
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_value =
      hourly_rate
      |> get_daily_rate()
      |> apply_discount(discount)
      
      budget / discounted_value
      |> Float.floor(1)
    
  end

  defp get_daily_rate(hourly_rate), do: daily_rate(hourly_rate)
end
