# Functions to read and write CSV files

# Ana Paola Minchaca
# 2021-10-08

defmodule CSVdata do
    @moduledoc """
    Functions to open a CSV file, and convert it into a matrix
    """
    
    @doc """
    Return a matrix with the contents of a CSV file indicated as the argument
    """
    def read_data(filename) do
        data = filename
            |> File.stream!()
            |> Enum.map(&String.trim/1)
            # Using the 'capture' syntax
            |> Enum.map(&(String.split(&1, ",")))
            # Using a lambda function
            # |> Enum.map(fn row -> String.split(row, ",") end)

    end

    def make_numeric([header | data], types) do
        new_data = for row <- data do
                for {value, type} <- Enum.zip(row, types) do
                    case type do
                        :int -> String.to_integer(value) + 10
                        :float -> String.to_float(value)
                        _ -> value
                    end
                end
            end
        [header | new_data]
    end

    def write_data(data, filename) do
        {:ok, out_file} = File.open(filename, [:write])
        for row <- data do
            IO.puts(out_file, Enum.join(row, ","))
        end
        File.close(out_file)
    end

    def main() do
        filename = "market_products.csv"
        types = [:str, :int, :float]
        # data = make_numeric(read_data(filename))
        data = filename
            |> read_data()
            |> make_numeric(types)
            |> IO.inspect()
            |> write_data(filename)
    end
end