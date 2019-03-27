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

  def add(number_1, number_2) do
    raise "Not implemented"
  end

  def subtract(number_1, number_2) do
    raise "Not implemented"
  end

  def multiply(number_1, number_2) do
    raise "Not implemented"
  end

  def less_than?(number_1, number_2) do
    raise "Not implemented"
  end
end