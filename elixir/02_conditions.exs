# Conditional statements in Elixir
#
# Ana Paola Minchaca
# 2021-09-14

sign = fn (number) ->
if number < 0 do
        :negative
    else
        if number > 0 do 
            :positive
        else
            :zero
        end # End of inner if
    end # End of outer if
end # End of function

# Test the function
IO.puts "Sign of 8 is #{sign.(8)}"
IO.puts "Sign of -8 is #{sign.(-8)}"
IO.puts "Sign of 0 is #{sign.(0)}"

# Version with cond

sign2 = fn (number) ->
    cond do
        number < 0 -> :negative
        number > 0 -> :positive
        true -> :zero
    end
end # End of function 

# Test the function
IO.puts "Sign of 8 is #{sign2.(8)}"
IO.puts "Sign of -8 is #{sign2.(-8)}"
IO.puts "Sign of 0 is #{sign2.(0)}"

letter_to_grade = fn (letter) ->
    case letter do
        :A -> 100
        :B -> 80
        :C -> 60
    end # End of function 
end # End of function 

# Test the function
IO.puts "Grade for A is #{letter_to_grade.(:A)}"
IO.puts "Grade for B is #{letter_to_grade.(:B)}"
IO.puts "Grade for C is #{letter_to_grade.(:C)}"

