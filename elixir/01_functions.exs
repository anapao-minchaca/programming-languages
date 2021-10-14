# First functions in Elixir
#
# Ana Paola Minchaca
# 2021-09-14

# Create a function by naming a lambda
triangle_area = fn (base, height) -> base * height / 2 end

# Test calling the function
IO.puts("Testing #{triangle_area.(4,3)}")