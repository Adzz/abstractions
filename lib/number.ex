defmodule Number do
  defstruct [:sign, :size]

  def positive(size) do
    %Number{size: size, sign: :positive}
  end

  def negative(size) do
    %Number{size: size, sign: :negative}
  end

  def equal?(%{size: size_1, sign: sign_1}, %{sign: sign_2, size: size_2}) do
    sign_1 == sign_2 && size_1 == size_2
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
