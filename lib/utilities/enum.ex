defmodule Utilities.Enum do
  @moduledoc """
  Documentation for Utilities.
  """

  @type element :: any

  @doc """
  Return a list of idential x with length n

  ## Examples

      iex> Utilities.Enum.repeat("ok", 5)
      ["ok", "ok", "ok", "ok", "ok"]

  """
  @spec repeat(term(), integer()) :: list(term())
  def repeat(x, n), do: for(_ <- 1..n, do: x)

  @doc """
  Return a list of idential x with length n

  ## Examples

      iex> Utilities.Enum.zip_with([1, 2], [2, 3], &(&1 + &2))
      [3,5]

      iex> Utilities.Enum.zip_with([1, 2], [2, 3, 4], &(&1 + &2))
      [3,5]

  """
  @spec zip_with(list(element), list(element), (element, element -> element)) :: list(element)
  def zip_with(xs, ys, f) do
    do_zip_with(xs, ys, f, [])
  end

  defp do_zip_with([], _, _, acc), do: acc
  defp do_zip_with(_, [], _, acc), do: acc

  defp do_zip_with([x | xs], [y | ys], f, acc) do
    [f.(x, y) | do_zip_with(xs, ys, f, acc)]
  end

  @doc """
  Return true if all elements are unique

  ## Examples

      iex> Utilities.Enum.is_unique?(["a", "b", 'a', 9, %{}])
      true

      iex> Utilities.Enum.is_unique?([[1, 2], [1,2], 3])
      false

  """
  @spec is_unique?(list(element)) :: boolean()
  def is_unique?(xs) do
    Enum.uniq(xs) == xs
  end
end
