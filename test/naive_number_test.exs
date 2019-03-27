defmodule NaiveNumberTest do
  use ExUnit.Case
  doctest NaiveNumber, import: true

  describe "equality" do
    test "+10 = +10" do
      assert NaiveNumber.equal?(NaiveNumber.positive(10), NaiveNumber.positive(10)) == true
    end

    test "+10 != +5" do
      assert NaiveNumber.equal?(NaiveNumber.positive(10), NaiveNumber.positive(5)) == false
    end

    test "+5 != +10" do
      assert NaiveNumber.equal?(NaiveNumber.positive(5), NaiveNumber.positive(10)) == false
    end

    test "-10 == -10" do
      assert NaiveNumber.equal?(NaiveNumber.negative(10), NaiveNumber.negative(10)) == true
    end

    test "-10 != -5" do
      assert NaiveNumber.equal?(NaiveNumber.negative(10), NaiveNumber.negative(5)) == false
    end

    test "-5 != -10" do
      assert NaiveNumber.equal?(NaiveNumber.negative(5), NaiveNumber.negative(10)) == false
    end

    test "-10 != +10" do
      assert NaiveNumber.equal?(NaiveNumber.negative(10), NaiveNumber.positive(10)) == false
    end

    test "+10 != -10" do
      assert NaiveNumber.equal?(NaiveNumber.positive(10), NaiveNumber.negative(10)) == false
    end
  end

  describe "addition" do
    test "+10 + +10" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.positive(10), NaiveNumber.positive(10)),
               NaiveNumber.positive(20)
             )
    end

    test "-10 + -10" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.negative(10), NaiveNumber.negative(10)),
               NaiveNumber.negative(20)
             )
    end

    test "-10 + +15" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.negative(10), NaiveNumber.positive(15)),
               NaiveNumber.positive(5)
             )
    end

    test "+10 + -15" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.positive(10), NaiveNumber.negative(15)),
               NaiveNumber.negative(5)
             )
    end

    test "+15 + -10" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.positive(15), NaiveNumber.negative(10)),
               NaiveNumber.positive(5)
             )
    end

    test "-15 + +10" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.negative(15), NaiveNumber.positive(10)),
               NaiveNumber.negative(5)
             )
    end

    test "+ 1 + -1 = -1 + +1" do
      assert NaiveNumber.equal?(
               NaiveNumber.add(NaiveNumber.positive(1), NaiveNumber.negative(1)),
               NaiveNumber.add(NaiveNumber.negative(1), NaiveNumber.positive(1))
             )
    end
  end

  describe "subtraction" do
    test "+15 - +10" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.positive(15), NaiveNumber.positive(10)),
               NaiveNumber.positive(5)
             )
    end

    test "+10 - +15" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.positive(10), NaiveNumber.positive(15)),
               NaiveNumber.negative(5)
             )
    end

    test "-5 - -10" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.negative(5), NaiveNumber.negative(10)),
               NaiveNumber.positive(5)
             )
    end

    test "-10 - -5" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.negative(10), NaiveNumber.negative(5)),
               NaiveNumber.negative(5)
             )
    end

    test "-10 - +15" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.negative(10), NaiveNumber.positive(15)),
               NaiveNumber.negative(25)
             )
    end

    test "+10 - -15" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.positive(10), NaiveNumber.negative(15)),
               NaiveNumber.positive(25)
             )
    end

    test "+15 - -10" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.positive(15), NaiveNumber.negative(10)),
               NaiveNumber.positive(25)
             )
    end

    test "-15 - +10" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.negative(15), NaiveNumber.positive(10)),
               NaiveNumber.negative(25)
             )
    end

    test "+1 - +1 = -1 - -1" do
      assert NaiveNumber.equal?(
               NaiveNumber.subtract(NaiveNumber.positive(1), NaiveNumber.positive(1)),
               NaiveNumber.subtract(NaiveNumber.negative(1), NaiveNumber.negative(1))
             )
    end
  end

  describe "multiplication" do
    test "+2 × +3 = +6" do
      assert NaiveNumber.equal?(
               NaiveNumber.multiply(NaiveNumber.positive(2), NaiveNumber.positive(3)),
               NaiveNumber.positive(6)
             )
    end

    test "-2 × -3 = +6" do
      assert NaiveNumber.equal?(
               NaiveNumber.multiply(NaiveNumber.negative(2), NaiveNumber.negative(3)),
               NaiveNumber.positive(6)
             )
    end

    test "+2 × -3 = -6'" do
      assert NaiveNumber.equal?(
               NaiveNumber.multiply(NaiveNumber.positive(2), NaiveNumber.negative(3)),
               NaiveNumber.negative(6)
             )
    end

    test "-2 × +3 = -6" do
      assert NaiveNumber.equal?(
               NaiveNumber.multiply(NaiveNumber.negative(2), NaiveNumber.positive(3)),
               NaiveNumber.negative(6)
             )
    end

    test "+2 × +0 = -3 × +0" do
      assert NaiveNumber.equal?(
               NaiveNumber.multiply(NaiveNumber.positive(2), NaiveNumber.positive(0)),
               NaiveNumber.multiply(NaiveNumber.negative(3), NaiveNumber.positive(0))
             )
    end
  end

  describe "ordering" do
    test "+1 < +2" do
      assert NaiveNumber.less_than?(NaiveNumber.positive(1), NaiveNumber.positive(2))
    end

    test "+2 ≮ +1" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(2), NaiveNumber.positive(1))
    end

    test "-1 ≮ -2" do
      refute NaiveNumber.less_than?(NaiveNumber.negative(1), NaiveNumber.negative(2))
    end

    test "+1 ≮ -2" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(1), NaiveNumber.negative(2))
    end

    test "-2 < +1" do
      assert NaiveNumber.less_than?(NaiveNumber.negative(2), NaiveNumber.positive(1))
    end

    test "-1 < +2" do
      assert NaiveNumber.less_than?(NaiveNumber.negative(1), NaiveNumber.positive(2))
    end

    test "+2 ≮ -1" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(2), NaiveNumber.negative(1))
    end

    test "+0 ≮ -0" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(0), NaiveNumber.negative(0))
    end

    test "-0 ≮ +0" do
      refute NaiveNumber.less_than?(NaiveNumber.negative(0), NaiveNumber.positive(0))
    end

    test "+0 ≮ -1" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(0), NaiveNumber.negative(1))
    end

    test "-1 < +0" do
      assert NaiveNumber.less_than?(NaiveNumber.negative(1), NaiveNumber.positive(0))
    end

    test "-0 < +1" do
      assert NaiveNumber.less_than?(NaiveNumber.negative(0), NaiveNumber.positive(1))
    end

    test "+1 ≮ -0" do
      refute NaiveNumber.less_than?(NaiveNumber.positive(1), NaiveNumber.negative(0))
    end
  end
end
