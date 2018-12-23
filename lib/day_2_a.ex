defmodule Day2A do
  def checksum(input) do
    input
    |> String.split()
    |> Enum.map(fn x ->
      Enum.reduce(String.graphemes(x), %{}, fn each, acc ->
        Map.update(acc, each, 1, &(&1 + 1))
      end)
    end)
    |> Enum.map(&Map.values/1)
    |> multiply
  end

  def multiply(values) do
    count(values, 2) * count(values, 3)
  end

  def count(values, number) do
    Enum.count(values, fn x -> Enum.member?(x, number) end)
  end
end
