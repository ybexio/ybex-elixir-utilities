defmodule Utilities.List do
  @moduledoc """
  Documentation for Utilities.
  """

  @type element :: any

  @doc """
  Applied to a predicate p and a list xs, returns a tuple where first element is elments of xs that satisfy p and second element is the remainder of the list:
  span(p, xs) is equivalent to {takeWhile(p, xs), dropWhile(p, xs)} but only tranverse once

  ## Examples

      iex> Utilities.List.span(&(&1 > 5), [1,2,3,4,5,6,7])
      {[6,7], [1,2,3,4,5]}

      iex> Utilities.List.span(&(&1 == "alice"), ["bob", "chris"])
      {[], ["bob", "chris"]}

  """
  @spec span((element() -> boolean), list(element())) :: {list(element), list(element)}
  def span(predicate, xs) do
    {xs, ys} = do_span(predicate, xs, {[], []})
    {Enum.reverse(xs), Enum.reverse(ys)}
  end

  defp do_span(_predicate, [], acc) do
    acc
  end

  defp do_span(p, [x], {acc1, acc2}) do
    if p.(x) do
      {[x | acc1], acc2}
    else
      {acc1, [x | acc2]}
    end
  end

  defp do_span(p, [x | xs], {acc1, acc2}) do
    new_acc =
      if p.(x) do
        {[x | acc1], acc2}
      else
        {acc1, [x | acc2]}
      end

    do_span(p, xs, new_acc)
  end
end
