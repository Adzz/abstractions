defmodule Number do
  defstruct [:sign, :size]

  def positive(size) do
    %Number{size: size, sign: :positive}
  end

  def negative(size) do
    %Number{size: size, sign: :negative}
  end

  def equal?(number_1 = %{size: size_1, sign: sign_1}, number_2 = %{sign: sign_2, size: size_2}) do
    if sign_1 == sign_2 do
      size_1 == size_2
    else
      false
    end
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
