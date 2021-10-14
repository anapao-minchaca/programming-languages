# Recursive functions in Elixir
#
# Ana Paola Minchaca
# 2021-09-14


# Create a module
defmodule Factorial do

    # Named functions always go inside modules
    def fact1(n) do
        if n == 0 do
            1
        else
            n * fact1(n-1)
        end
    end

    # Pattern matching version
    def fact2(0), do: 1
    def fact2(n), do:  n * fact2(n-1)

    # Tail recursion version
    def fact3(n), do: do_fact3(n, 1)
    # Private functions that take 2 arguments
    defp do_fact3(0, a), do: a
    defp do_fact3(n, a), do: do_fact3(n-1, n*a)
end

# Test the function in a module
IO.puts "Factorial of 5 is #{Factorial.fact1(5)}"
IO.puts "Factorial of 5 is #{Factorial.fact2(5)} with pattern matching"
IO.puts "Factorial of 5 is #{Factorial.fact3(5)} with tail recursion"
