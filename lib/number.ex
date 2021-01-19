defmodule Number do
  defstruct [:sign, :size]

  def positive(size) do
     %Number{size: size, sign: :positive}
  end

  def negative(size) do
    %Number{size: size, sign: :negative}
  end

  def equal?(number_1, number_2) do
    raise "Not implemented"
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
