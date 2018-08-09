defmodule Chop do

# Recursively 
    def guess(actual, min..max) do
        g = div(max - min, 2) + min
        IO.puts("Is it #{g}")
        check_g(g, min..max, actual)
    end

    defp check_g(g, _, actual) when g === actual, do: IO.puts(actual)

    defp check_g(g, _min..max, actual) when g < actual, do: guess(actual, g..max) 

    defp check_g(g, min.._max, actual) when g > actual, do: guess(actual, min..g)
    
end