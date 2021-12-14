defmodule AdventOfCode.Day03 do
  def get_digits(input) do
    digits =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line -> line |> String.to_char_list() end)

    bits_length = (digits |> Enum.at(0) |> length()) - 1

    for pos <- 0..bits_length do
      digits |> Enum.map(fn line -> line |> Enum.at(pos) end)
    end
  end

  def get_gamma_rate(digits) do
    digits
    |> Enum.reduce([], fn digits, acc ->
      total = digits |> length()
      zeros = digits |> Enum.count(fn digit -> digit == ?0 end)
      ones = total - zeros
      bit_gamma = if zeros > ones, do: 0, else: 1
      acc ++ [bit_gamma]
    end)
  end

  def get_epsilom_rate(gama_rate) do
    gama_rate |> Enum.map(fn bit -> if bit == 0, do: 1, else: 0 end)
  end

  def get_decimal_rate(rate) do
    rate |> Enum.join("") |> String.to_integer(2)
  end

  def part1(input) do
    gama_rate =
      input
      |> get_digits()
      |> get_gamma_rate()

    epsilom_rate = get_epsilom_rate(gama_rate)

    get_decimal_rate(gama_rate) * get_decimal_rate(epsilom_rate)
  end

  def part2(args) do
  end
end
