defmodule Day1B do
  def first_duplicate(input) do
    input
    |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new()}, fn x, {current_sum, map_set} ->
      if MapSet.member?(map_set, current_sum),
        do: {:halt, current_sum},
        else: {:cont, {x + current_sum, MapSet.put(map_set, current_sum)}}
    end)
  end
end
