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

    test "+0 == -0" do
      assert Number.equal?(Number.positive(0), Number.negative(0)) == true
    end
  end

  describe "addition" do
    test "+10 + +10" do
      assert Number.equal?(
               Number.add(Number.positive(10), Number.positive(10)),
               Number.positive(20)
             )
    end

    test "-10 + -10" do
      assert Number.equal?(
               Number.add(Number.negative(10), Number.negative(10)),
               Number.negative(20)
             )
    end

    test "-10 + +15" do
      assert Number.equal?(
               Number.add(Number.negative(10), Number.positive(15)),
               Number.positive(5)
             )
    end

    test "+10 + -15" do
      assert Number.equal?(
               Number.add(Number.positive(10), Number.negative(15)),
               Number.negative(5)
             )
    end

    test "+15 + -10" do
      assert Number.equal?(
               Number.add(Number.positive(15), Number.negative(10)),
               Number.positive(5)
             )
    end

    test "-15 + +10" do
      assert Number.equal?(
               Number.add(Number.negative(15), Number.positive(10)),
               Number.negative(5)
             )
    end

    test "+ 1 + -1 = -1 + +1" do
      assert Number.equal?(
               Number.add(Number.positive(1), Number.negative(1)),
               Number.add(Number.negative(1), Number.positive(1))
             )
    end
  end

  describe "subtraction" do
    test "+15 - +10" do
      assert Number.equal?(
               Number.subtract(Number.positive(15), Number.positive(10)),
               Number.positive(5)
             )
    end

    test "+10 - +15" do
      assert Number.equal?(
               Number.subtract(Number.positive(10), Number.positive(15)),
               Number.negative(5)
             )
    end

    test "-5 - -10" do
      assert Number.equal?(
               Number.subtract(Number.negative(5), Number.negative(10)),
               Number.positive(5)
             )
    end

    test "-10 - -5" do
      assert Number.equal?(
               Number.subtract(Number.negative(10), Number.negative(5)),
               Number.negative(5)
             )
    end

    test "-10 - +15" do
      assert Number.equal?(
               Number.subtract(Number.negative(10), Number.positive(15)),
               Number.negative(25)
             )
    end

    test "+10 - -15" do
      assert Number.equal?(
               Number.subtract(Number.positive(10), Number.negative(15)),
               Number.positive(25)
             )
    end

    test "+15 - -10" do
      assert Number.equal?(
               Number.subtract(Number.positive(15), Number.negative(10)),
               Number.positive(25)
             )
    end

    test "-15 - +10" do
      assert Number.equal?(
               Number.subtract(Number.negative(15), Number.positive(10)),
               Number.negative(25)
             )
    end

    test "+1 - +1 = -1 - -1" do
      assert Number.equal?(
               Number.subtract(Number.positive(1), Number.positive(1)),
               Number.subtract(Number.negative(1), Number.negative(1))
             )
    end
  end

  describe "multiplication" do
    test "+2 × +3 = +6" do
      assert Number.equal?(
               Number.multiply(Number.positive(2), Number.positive(3)),
               Number.positive(6)
             )
    end

    test "-2 × -3 = +6" do
      assert Number.equal?(
               Number.multiply(Number.negative(2), Number.negative(3)),
               Number.positive(6)
             )
    end

    test "+2 × -3 = -6'" do
      assert Number.equal?(
               Number.multiply(Number.positive(2), Number.negative(3)),
               Number.negative(6)
             )
    end

    test "-2 × +3 = -6" do
      assert Number.equal?(
               Number.multiply(Number.negative(2), Number.positive(3)),
               Number.negative(6)
             )
    end

    test "+2 × +0 = -3 × +0" do
      assert Number.equal?(
               Number.multiply(Number.positive(2), Number.positive(0)),
               Number.multiply(Number.negative(3), Number.positive(0))
             )
    end
  end

  describe "ordering" do
    test "+1 < +2" do
      assert Number.less_than?(Number.positive(1), Number.positive(2))
    end

    test "+2 ≮ +1" do
      refute Number.less_than?(Number.positive(2), Number.positive(1))
    end

    test "-1 ≮ -2" do
      refute Number.less_than?(Number.negative(1), Number.negative(2))
    end

    test "+1 ≮ -2" do
      refute Number.less_than?(Number.positive(1), Number.negative(2))
    end

    test "-2 < +1" do
      assert Number.less_than?(Number.negative(2), Number.positive(1))
    end

    test "-1 < +2" do
      assert Number.less_than?(Number.negative(1), Number.positive(2))
    end

    test "+2 ≮ -1" do
      refute Number.less_than?(Number.positive(2), Number.negative(1))
    end

    test "+0 ≮ -0" do
      refute Number.less_than?(Number.positive(0), Number.negative(0))
    end

    test "-0 ≮ +0" do
      refute Number.less_than?(Number.negative(0), Number.positive(0))
    end

    test "+0 ≮ -1" do
      refute Number.less_than?(Number.positive(0), Number.negative(1))
    end

    test "-1 < +0" do
      assert Number.less_than?(Number.negative(1), Number.positive(0))
    end

    test "-0 < +1" do
      assert Number.less_than?(Number.negative(0), Number.positive(1))
    end

    test "+1 ≮ -0" do
      refute Number.less_than?(Number.positive(1), Number.negative(0))
    end

    # test "+10 + -15" do
    #   assert Number.add(Number.positive(10), Number.negative(15)) == Number.negative(5)
    # end

    # test "+15 + -10" do
    #   assert Number.add(Number.positive(15), Number.negative(10)) == Number.positive(5)
    # end

    # test "-15 + +10" do
    #   assert Number.add(Number.negative(15), Number.positive(10)) == Number.negative(5)
    # end

    # test "+ 1 + -1 = -1 + +1" do
    #   assert Number.equal?(
    #            Number.add(Number.positive(1), Number.negative(1)),
    #            Number.add(Number.negative(1), Number.positive(1))
    #          )
    # end
  end
end
