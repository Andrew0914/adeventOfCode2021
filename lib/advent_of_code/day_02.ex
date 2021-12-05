defmodule AdventOfCode.Day02 do
  def get_parsed_instructions(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn instruction ->
      instruction_parts = instruction |> String.trim() |> String.split(" ")
      {instruction_parts |> Enum.at(0), instruction_parts |> Enum.at(1) |> String.to_integer()}
    end)
  end

  def calculate_step({x, y}, {"forward", steps}) do
    {x + steps, y}
  end

  def calculate_step({x, y}, {"up", steps}) do
    {x, y + steps}
  end

  def calculate_step({x, y}, {"down", steps}) do
    {x, y - steps}
  end

  def calculate_position(instructions) do
    instructions
    |> Enum.reduce({0, 0}, fn instruction, position ->
      calculate_step(position, instruction)
    end)
  end

  def part1(args) do
    {x, y} = args |> get_parsed_instructions() |> calculate_position()
    abs(x) * abs(y)
  end

  def part2(args) do
  end
end
