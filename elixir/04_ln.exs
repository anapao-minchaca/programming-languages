# Recursive functions in Elixir
#
# Ana Paola Minchaca
# 2021-09-17


# Create a module
defmodule Ln do
# Named functions always go inside modules
    def ln2(iter) do
        if iter == 0 do
            0.0
        else
            (1/(2*iter*((2*iter)-1))) + ln2(iter-1)
        end
    end

    # Tail recursion version
    def ln2tail(iter), do: do_ln2tail(iter, 0)
    # Private functions that take 2 arguments
    defp do_ln2tail(0, a), do: a
    defp do_ln2tail(iter, a), do: do_ln2tail(iter-1, (1/(2*iter*((2*iter)-1))) + a)
end

# Test the function in a module
IO.puts "Ln of 100000 is #{Ln.ln2(100000)}"
IO.puts "Ln of 100000 is #{Ln.ln2tail(100000)}"