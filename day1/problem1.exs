{:ok, contents} = File.read("input.txt")

answer =
  contents
  |> String.trim()
  |> String.split("\n")
  # Split lines by triple spaces
  |> Enum.map(&String.split(&1, "   "))
  # Convert strings to integers
  |> Enum.map(fn line -> Enum.map(line, &String.to_integer/1) end)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  |> Enum.map(&Enum.sort/1)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  # Calculate absolute difference for each sublist
  |> Enum.map(fn [a, b] -> abs(a - b) end)
  |> Enum.sum()

IO.inspect(answer)
