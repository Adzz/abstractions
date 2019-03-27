defmodule Number do
  defstruct [:left, :right]

  def positive(number) do
    %Number{left: 0, right: number}
  end

  def negative(number) do
    %Number{left: number, right: 0}
  end

  def equal?(%{left: left, right: right}, %{left: other_left, right: other_right}) do
    left + other_right == other_left + right
  end

  def add(%{left: left, right: right}, %{left: other_left, right: other_right}) do
    %Number{left: left + other_left, right: right + other_right}
  end

  def subtract(%{left: left, right: right}, %{left: other_left, right: other_right}) do
    %Number{left: left + other_right, right: right + other_left}
  end

  def multiply(%{left: left, right: right}, %{left: other_left, right: other_right}) do
    %Number{
      left: left * other_right + other_left * right,
      right: left * other_left + right * other_right
    }
  end

  def less_than?(number_1, number_2) do
    raise "Not implemented"
  end
end
