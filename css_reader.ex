defmodule MyCSVReader do
  def read_csv_file(file_path) do
    file_path
    |> File.stream!()
    |> CSV.decode(headers: true) # Set `headers: true` if your CSV has headers, otherwise omit this option
    |> Stream.map(fn row ->
      # Process each row here
      # `row` is a map with the column headers as keys if `headers: true` is set
      # otherwise, it's a list of values in the order they appear in the CSV
      process_row(row)
    end)
    |> Stream.run() # This is where the stream starts to be processed
  end

  defp process_row(row) do
    # Implement your row processing logic here
    IO.inspect(row)
  end
end
