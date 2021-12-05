defmodule AdventOfCode.Day01 do
  def get_measurements(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn str ->
      str |> String.trim() |> String.to_integer()
    end)
  end

  def detect_increments(measurements) do
    measurements
    |> Enum.reduce({0, 0}, fn measurement, {index, acc} ->
      if index <= 0 do
        {index + 1, 0}
      else
        acc = if measurement > Enum.at(measurements, index - 1), do: acc + 1, else: acc + 0
        {index + 1, acc}
      end
    end)
    |> elem(1)
  end

  def part1(args) do
    args
    |> get_measurements()
    |> detect_increments()
  end

  def calculate_trio_sums(measurements) do
    measurements
    |> Enum.reduce({0, []}, fn measurement, {index, acc} ->
      value_one = Enum.at(measurements, index + 1)
      value_two = Enum.at(measurements, index + 2)
      value_one = if is_integer(value_one), do: value_one, else: 0
      value_two = if is_integer(value_two), do: value_two, else: 0

      {index + 1, acc ++ [measurement + value_one + value_two]}
    end)
    |> elem(1)
  end

  def part2(args) do
    args |> get_measurements() |> calculate_trio_sums() |> detect_increments()
  end
end
