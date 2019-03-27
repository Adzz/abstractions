defmodule NaiveNumber do
  defstruct [:sign, :size]

  def positive(size) do
    %NaiveNumber{size: size, sign: :positive}
  end

  def negative(size) do
    %NaiveNumber{size: size, sign: :negative}
  end

  def equal?(%{size: 0}, %{size: 0}), do: true

  def equal?(%{size: size_1, sign: sign_1}, %{sign: sign_2, size: size_2}) do
    sign_1 == sign_2 && size_1 == size_2
  end

  def add(%{size: size_1, sign: :positive}, %{sign: :negative, size: size_2}) do
    if size_1 > size_2 do
      %NaiveNumber{sign: :positive, size: size_1 - size_2}
    else
      %NaiveNumber{sign: :negative, size: size_2 - size_1}
    end
  end

  def add(%{size: size_1, sign: :negative}, %{sign: :positive, size: size_2}) do
    if size_1 > size_2 do
      %NaiveNumber{sign: :negative, size: size_1 - size_2}
    else
      %NaiveNumber{sign: :positive, size: size_2 - size_1}
    end
  end

  def add(%{size: size_1, sign: sign}, %{size: size_2}) do
    %NaiveNumber{sign: sign, size: size_1 + size_2}
  end

  def subtract(%{size: size_1, sign: :positive}, %{sign: :positive, size: size_2}) do
    if size_1 > size_2 do
      %NaiveNumber{sign: :positive, size: size_1 - size_2}
    else
      %NaiveNumber{sign: :negative, size: size_2 - size_1}
    end
  end

  def subtract(%{size: size_1, sign: :negative}, %{sign: :negative, size: size_2}) do
    if size_1 > size_2 do
      %NaiveNumber{sign: :negative, size: size_1 - size_2}
    else
      %NaiveNumber{sign: :positive, size: size_2 - size_1}
    end
  end

  def subtract(%{size: size_1, sign: :positive}, %{sign: :negative, size: size_2}) do
    %NaiveNumber{sign: :positive, size: size_1 + size_2}
  end

  def subtract(%{size: size_1, sign: :negative}, %{sign: :positive, size: size_2}) do
    %NaiveNumber{sign: :negative, size: size_1 + size_2}
  end

  def multiply(%{size: size_1, sign: sign_1}, %{sign: sign_2, size: size_2}) do
    if sign_1 == sign_2 do
      %NaiveNumber{sign: :positive, size: size_1 * size_2}
    else
      %NaiveNumber{sign: :negative, size: size_1 * size_2}
    end
  end

  def less_than?(%{size: 0}, %{size: 0}) do
    false
  end

  def less_than?(%{size: size_1, sign: :positive}, %{sign: :positive, size: size_2}) do
    size_1 < size_2
  end

  def less_than?(%{sign: :negative}, %{sign: :positive}) do
    true
  end

  def less_than?(%{sign: :positive}, %{sign: :negative}) do
    false
  end

  def less_than?(%{size: size_1, sign: :negative}, %{sign: :negative, size: size_2}) do
    size_1 > size_2
  end
end
