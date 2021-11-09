# HW8: Concurrent programs

# Ana Paola Minchaca
# 2021-11-03

defmodule Primes do
    
    @doc """
    FUNCTIONS: primes_sequential, primes, is_prime
    INPUT: initial number to sum from 2 up to all the prime numbers up until that number
    OUTPUT: sum of the prime numbers
    """

    # sum of the list of prime numbers
    def primes_sequential(n), do: primes(n, 2) |> Enum.sum

    # make list of prime numbers
    def primes(n, n), do: []
    def primes(n, a) do
        case is_prime(a) do
            true -> [a | primes(n, a + 1)]
            _ -> primes(n, a + 1)
        end
    end
    
    # function to check whether the num is a prime or not
    def is_prime(2), do: true
    def is_prime(3), do: true
    def is_prime(n) do
        i = 2

        square = :math.sqrt(n)
            |> Float.floor
            |> round

        !Enum.any?(i..square, &(rem(n, &1) == 0))
    end

    @doc """
    FUNCTIONS: primes_range, primes_parallel
    INPUT: takes a range of numbers, checks whether they are prime or not and sums them
    OUTPUT: sum of the primes numbers
    """

    # have range of numbers, filters the truth values and sums them
    def primes_range(a, b), do: Enum.filter(a..b, &is_prime/1) |> Enum.sum

    # computing the primes in parallel, using as many threads as terms in the calculation
    def primes_parallel(limit) do
        cores = 8
        block = div(limit, cores)
        _result = 1..cores
            |> Enum.map(&Task.async(fn -> primes_range(((&1 - 1) * block) + 1, &1 * block) end))
            |> Enum.map(&Task.await(&1, 50000))
            |> Enum.sum()
    end

end 