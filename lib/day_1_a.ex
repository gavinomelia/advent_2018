defmodule Day1A do
  def calibrate(input) do
    input
    |> String.split()
    |> Enum.reduce(0, fn x, acc -> String.to_integer(x) + acc end)
  end
end
