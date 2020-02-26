defmodule SimpleListDemo do
  defmodule EmptyError do
    defexception message: "oops, empty"
  end

  # reduce/3

  ## base case
  def reduce([], acc, _fun), do: acc

  ## iterative case
  def reduce([head | tail], acc, fun) do
    reduce(tail, fun.(acc, head), fun)
  end

  # reduce/2

  ## empty case
  def reduce([], _fun), do: raise EmptyError

  ## iterative case
  def reduce([head | tail], fun) do
    reduce(tail, head, fun)
  end

  # reverse
  def reverse(list) do
    reduce(list, [], fn acc, element -> [element | acc] end)
  end

  # filter
  def filter(list, fun) do
    list
    |> reduce([], fn acc, element ->
      if fun.(element), do: [element | acc], else: acc
    end)
    |> reverse()
  end

  # map
  def map(list, fun) do
    list
    |> reduce([], fn acc, element ->
      [fun.(element) | acc]
    end)
    |> reverse()
  end

end
