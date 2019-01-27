defmodule Number do
  defstruct [:sign, :size]

  # what are numbers ?

  def positive(size) do
    %__MODULE__{sign: :positive, size: size}
  end

  def negative(size) do
    %__MODULE__{sign: :negative, size: size}
  end

  def equal?(%__MODULE__{sign: sign_1, size: size_1}, %__MODULE__{sign: sign_2, size: size_2}) do
    if sign_1 == sign_2 do
      size_1 == size_2
    else
      false
    end
  end

  def add(%__MODULE__{sign: sign_1, size: size_1}, %__MODULE__{sign: sign_2, size: size_2}) do
    # if sign_1 == sign_2 do
    #   apply(__MODULE__, sign_1, [size_1 + size_2])
    # else
    #   if sign_1 == :positive && size_1 > size_2 do
    #     positive(size_1 + size_2)
    #   end
    # end

    cond do
      sign_1 == sign_2 -> apply(__MODULE__, sign_1, [size_1 + size_2])
      sign_1 == :negative && size_1 < size_2 -> positive(size_1 - size_2)
      true -> positive(size_1 + size_2)
    end
  end

  # def -(other)
  #   fail 'unimplemented'
  # end

  # def *(other)
  #   fail 'unimplemented'
  # end

  # def <(other)
  #   fail 'unimplemented'
  # end
end
