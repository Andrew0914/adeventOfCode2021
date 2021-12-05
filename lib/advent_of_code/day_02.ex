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

  def calculate_step({horizontal, depth, depth_aim}, {"forward", steps}) do
    {horizontal + steps, depth, depth_aim + depth * steps}
  end

  def calculate_step({horizontal, depth, depth_aim}, {"up", steps}) do
    {horizontal, depth - steps, depth_aim}
  end

  def calculate_step({horizontal, depth, depth_aim}, {"down", steps}) do
    {horizontal, depth + steps, depth_aim}
  end

  def calculate_position(instructions) do
    instructions
    |> Enum.reduce({0, 0, 0}, fn instruction, position ->
      calculate_step(position, instruction)
    end)
  end

  def part1(args) do
    {horizontal, depth, _} = args |> get_parsed_instructions() |> calculate_position()
    abs(horizontal * depth)
  end

  def part2(args) do
    {horizontal, depth, depth_aim} = args |> get_parsed_instructions() |> calculate_position()
    abs(horizontal * depth_aim)
  end
end
