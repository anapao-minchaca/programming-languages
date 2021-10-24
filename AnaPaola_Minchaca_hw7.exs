# HW7: Functional programs

# Ana Paola Minchaca
# 2021-10-18

defmodule CSVdata do
    
    @doc """
    FUNCTION: read_data
    INPUT: takes a string with the full path to a CSV file
    OUTPUT: return a matrix with the contents of a CSV file indicated as the argument
    """
    def read_data(filename) do
        data = filename
            |> File.stream!()
            |> Enum.map(&String.trim/1)
            # Using the 'capture' syntax
            |> Enum.map(&(String.split(&1, ",")))
    end

    @doc """
    Convert into int or float the fields that require it
    Use a second list that indicates the type of each column
    """
    def make_numeric([header | data], types) do
        # The first list comprehension works on each row of the matrix
        new_data = for row <- data do
                    # The second comprehension works on each column of the row
                    # pairs the columns with the types, using zip
                    for {value, type} <- Enum.zip(row, types) do
                        # Convert the value in the column depending on the type
                        case type do
                        # Just to see the changes, add 10 to the stock
                        :int -> String.to_integer(value)
                        :float -> String.to_float(value)
                        _ -> value
                        end
                    end
                    end
        # Join back the header that was separated when getting the arguments
        [header | new_data]
    end

    @doc """
    FUNCTION: write_data
    INPUT: takes a matrix with data and a string with the path
    OUTPUT: contents of the matrix into a file, in CSV format
    """
    def write_data(data, filename) do
        {:ok, out_file} = File.open(filename, [:write])
        for row <- data do
            IO.puts(out_file, Enum.join(row, ","))
        end
        File.close(out_file)
    end

    @doc """
    FUNCTION: sum_column
    INPUT: takes a matrix with data and an identifier for the column to use
    OUTPUT: sum of all the numbers in the column
    """
    def sum_column([header | data], identifier) do
        new_data = for row <- data do
        # we find the platform video column
            if Enum.at(row, identifier) == 1, do: 1, else: 0
        end
        # sum the values of new data
        [Enum.at(header, identifier), Enum.sum(new_data)]
    end

    @doc """
    FUNCTION: aggregate
    INPUT: takes a matrix with data and two column identifiers
    OUTPUT: list of tuples, with many elements as different items in the aggregate column
    """
    def aggregate(data, identifier1, identifier2) do
        new_data = for row <- data do
        # we find the platform column
            if Enum.at(row, identifier2) == 1, do:
                Enum.at(row, identifier1),
                # we find the year column
            else: "Years not found"
        end
        # count every element of the map and convert it to a list
        new_data2 = Map.to_list(Enum.frequencies(new_data))
        # sort by ascending order our new list of data
        Enum.sort(tuple_to_list(new_data2), :asc)
    end

    @doc """
    AUXILIAR FUNCTION: tuple_to_list
    INPUT: takes a list
    OUTPUT: makes the tuples of the list a list of lists
    """
    def tuple_to_list(list), do:
        for {x, y} <- list, do: [x, y] 
    
    def main() do
        # short csv
        filename = "MoviesOnStreamingPlatforms_11_cols_short.csv"

        # long csv
        #filename = "MoviesOnStreamingPlatforms_11_columns.csv"

        # result csv's
        total_movies = "total_movies.csv"
        netflix_years = "netflix_years.csv"
        hulu_years = "hulu_years.csv"
        prime_years = "prime_video_years.csv"
        disney_years = "disney_years.csv"

        # defining the types for the csv
        types = [:int, :int, :str, :str, :str, :str, :str, :int, :int, :int, :int]

        # pipes for reading file
        data = filename
            |> read_data()
            |> make_numeric(types)

        # results
        rows = [7, 8, 9, 10]
        result = []
        
        # variables for first file
        result = for x <- rows, do: sum_column(data, x)
        write_data(result, total_movies)

        # variables for second file
        result1 = aggregate(data, 3, 7)
        write_data(result1, netflix_years)

        # variables for third file
        result2 = aggregate(data, 3, 8)
        write_data(result2, hulu_years)

        # variables for fourth file
        result3 = aggregate(data, 3, 9)
        write_data(result3, prime_years)

        # variables for fifth file
        result4 = aggregate(data, 3, 10)
        write_data(result4, disney_years)
    end
end