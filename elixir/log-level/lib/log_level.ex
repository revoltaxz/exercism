defmodule LogLevel do
  @legacy_codes 1..4
  @codes_with_label %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  def to_label(level, legacy?) do
    cond do
      legacy? and level in @legacy_codes ->
        @codes_with_label[level]

      !legacy? and level in 0..5 ->
        @codes_with_label[level]

      true ->
        :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] ->
        :ops

      label == :unknown and legacy? ->
        :dev1

      label == :unknown ->
        :dev2

      true ->
        nil
    end
  end
end
