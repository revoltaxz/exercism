defmodule Secrets do
  use Bitwise, only_operators: true

  def secret_add(secret), do: fn param -> param + secret end

  def secret_subtract(secret), do: fn param -> param - secret end

  def secret_multiply(secret), do: fn param -> param * secret end

  def secret_divide(secret), do: fn param -> div(param, secret) end

  def secret_and(secret), do: fn param -> param &&& secret end

  def secret_xor(secret), do: fn param -> Bitwise.bxor(secret, param) end

  def secret_combine(fun1, fun2) do
    fn param ->
      param |> fun1.() |> fun2.()
    end
  end
end
