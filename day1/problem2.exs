{:ok, contents} = File.read("input.txt")

{list1, list2} =
  contents
  |> String.trim()
  |> String.split("\n")
  # Split lines by triple spaces
  |> Enum.map(&String.split(&1, "   "))
  # Convert strings to integers
  |> Enum.map(fn line -> Enum.map(line, &String.to_integer/1) end)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  |> Enum.split(1)

list2_count_map =
  list2
  |> List.flatten()
  |> Enum.frequencies()

answer =
  list1
  |> List.flatten()
  # Remove duplicates from list1
  |> Enum.uniq()
  |> Enum.map(fn element ->
    # Multiply count of element in list2 with the element itself
    Map.get(list2_count_map, element, 0) * element
  end)
  |> Enum.sum()

IO.inspect(answer)
