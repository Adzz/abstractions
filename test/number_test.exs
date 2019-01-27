defmodule NumberTest do
  use ExUnit.Case
  doctest Number, import: true

  describe "equality" do
    test "+10 = +10" do
      assert Number.equal?(Number.positive(10), Number.positive(10)) == true
    end

    test "+10 != +5" do
      assert Number.equal?(Number.positive(10), Number.positive(5)) == false
    end

    test "+5 != +10" do
      assert Number.equal?(Number.positive(5), Number.positive(10)) == false
    end

    test "-10 == -10" do
      assert Number.equal?(Number.negative(10), Number.negative(10)) == true
    end

    test "-10 != -5" do
      assert Number.equal?(Number.negative(10), Number.negative(5)) == false
    end

    test "-5 != -10" do
      assert Number.equal?(Number.negative(5), Number.negative(10)) == false
    end

    test "-10 != +10" do
      assert Number.equal?(Number.negative(10), Number.positive(10)) == false
    end

    test "+10 != -10" do
      assert Number.equal?(Number.positive(10), Number.negative(10)) == false
    end
  end

  describe "addition" do
    test "+10 + +10" do
      assert Number.add(Number.positive(10), Number.positive(10)) == Number.positive(20)
    end

    test "-10 + -10" do
      assert Number.add(Number.negative(10), Number.negative(10)) == Number.negative(20)
    end

    test "-10 + +15" do
      assert Number.add(Number.negative(10), Number.positive(15)) == Number.positive(5)
    end
  end
end
