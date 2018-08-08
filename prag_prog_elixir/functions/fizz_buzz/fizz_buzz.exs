defmodule FizzBuzz do

# If a and b is 0 return "FizzBuzz"
# If a is 0 return "Fizz"
# If b is 0 return "Buzz"
# For anything else, return c.

    def say_buzz(a, b, c) do
      fn
        (0, 0, _) -> "FizzBuzz"
        (0, _, _) -> "Fizz"
        (_, 0, _) -> "Buzz"
        (_, _, c) -> c
      end
    end

    def multiples_of_3_or_5 (n) do
      fn
        (n) -> say_buzz(rem(n,3), rem(n,5), n)
      end
    end
end