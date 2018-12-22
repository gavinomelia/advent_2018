defmodule Day2A do
  def checksum(input) do
    split = String.split(input)

    Enum.map(split, fn x ->
      Enum.reduce(String.graphemes(x), %{}, fn each, acc ->
        Map.update(acc, each, 1, &(&1 + 1))
      end)
    end)
    |> multiply
  end

  def multiply(map) do
    values = Enum.map(map, &Map.values/1)

    count(values, 2) * count(values, 3)
  end

  def count(values, number) do
    Enum.map(values, fn each ->
      Enum.filter(each, fn x -> x == number end)
      |> Enum.uniq()
      |> Enum.count()
    end)
    |> Enum.sum()
  end
end
