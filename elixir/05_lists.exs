# Function with lists
#
# Ana Paola Minchaca
# 2021-09-21

defmodule Lists do

  # Add all the elements (numbers) in a list
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  # Add elements in a list, using tail recursion
  def tail_sum(list), do: do_tail_sum(list, 0)
  # Base case
  defp do_tail_sum([], result),
    do: result
  # Recursion
  defp do_tail_sum([head | tail], result),
    do: do_tail_sum(tail, head + result)

  # Duplicate all the elements in a list
  # The result is a new list
  def duplicate(list), do: do_duplicate(list, [])
  # Base case, invert the result to get the correct order
  defp do_duplicate([], result),
    do: Enum.reverse(result)
  # Recursion, adding the elements at the beginning of the result
  defp do_duplicate([head | tail], result),
    do: do_duplicate(tail, [head, head | result])


  # Duplicate all the elements in a list
  # The result is a new list
  def slow_duplicate(list), do: do_slow_dup(list, [])
  # Base case, with the list already in the correct order
  defp do_slow_dup([], result),
    do: result
  # Recursion, adding the elements at the end of the result
  defp do_slow_dup([head | tail], result),
    do: do_slow_dup(tail, result ++ [head, head])


  # Count the amount of even and odd numbers in the list
  def count_odd_even_tuple(list), do: do_count_tuple(list, {0, 0})

  defp do_count_tuple([], result),
    do: result
  # Use a GUARD to detect if the head is even, before entering the function
  defp do_count_tuple([head | tail], {even, odd}) when rem(head, 2) == 0,
    do: do_count_tuple(tail, {even + 1, odd})
  defp do_count_tuple([head | tail], {even, odd}),
    do: do_count_tuple(tail, {even, odd + 1})

  #defp do_count_tuple([head | tail], {even, odd}) do
  #  if rem(head, 2) == 0 do
  #    do_count_tuple(tail, {even + 1, odd})
  #  else
  #    do_count_tuple(tail, {even, odd + 1})
  #  end
  #end

  # Count the amount of even and odd numbers in the list
  def count_odd_even_map(list), do: do_count_map(list, %{even: 0, odd: 0})

  defp do_count_map([], result),
    do: result
  # Use a GUARD to detect if the head is even, before entering the function
  defp do_count_map([head | tail], %{even: even, odd: odd}) when rem(head, 2) == 0,
    do: do_count_map(tail, %{even: even + 1, odd: odd})
  defp do_count_map([head | tail], %{even: even, odd: odd}),
    do: do_count_map(tail, %{even: even, odd: odd + 1})

end