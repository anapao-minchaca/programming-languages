# HW5: Elixir lists
#
# Ana Paola Minchaca
# 2021-09-28

defmodule Lists do
# create a module

    # FUNCTION: swapper
    # INPUT: initial list, values to swap (a, b)
    # OUTPUT: new list swapped 

    def swapper(list, a, b) do
        for (i) <- list, do:
    # iterate through list, if values match then swap it with other value
            if i == a, do: b,
        else:
            if i == b, do: a,
        else:
            i 
    # else, return the rest of the list unchanged
    end

    # FUNCTION: invert_pairs
    # INPUT: initial tuple list
    # OUTPUT: new list with tuples swapped

    def invert_pairs(list) do
        Enum.map(list, fn {a, b} -> {b, a} end)
    end

    # FUNCTION: deep_reverse
    # INPUT: initial list or nested list
    # OUTPUT: list reversed or nested list reversed with it's elements reversed

    # define function
    def deep_reverse(list) do
        do_deep_reverse(list, [])
    end

    # base case
    defp do_deep_reverse([], reversed) do
        reversed
    end

    # check if the element we are inspecting is a list, case for nested lists
    defp do_deep_reverse([head | tail], reversed) when is_list(head) do
        do_deep_reverse(tail, [deep_reverse(head) | reversed])
    end

    # case for non nested lists
    defp do_deep_reverse([head | tail], reversed) do
        do_deep_reverse(tail, [head | reversed])
    end

    # FUNCTION: mean
    # INPUT: initial list
    # OUTPUT: average of all elements of list

    def mean(list), do: do_mean(list, 0, 0)
    defp do_mean([], 0, 0),
        do: 0
    # base case
    defp do_mean([], a, b), 
        do: a / b
    # recursion
    defp do_mean([head | tail], a, b) do
        do_mean(tail, a + head, b + 1)
    end

    # FUNCTION: standard deviation
    # INPUT: initial list
    # OUTPUT: computes the standard deviation

    def std_dev(list) do
        mean_list = mean(list)
        # average of list
        variance = for i <- list, do: :math.pow(i - mean_list, 2)
        # compute variance
        mean_variance = mean(variance)
        # average of variance
        :math.sqrt(mean_variance)
        # compute sqrt of variance and have the result
    end

# end of module
end
