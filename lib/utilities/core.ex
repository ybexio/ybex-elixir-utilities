defmodule Utilities.Core do
  @moduledoc """
  Documentation for Core utility function.
  """

  @type element :: any

  @doc """
  Takes a function of no args, presumably with side effects, and
  returns :ok after applying the sequence of function

  ## Examples

      iex> Utilities.Core.repeatedly(5, fn -> IO.inspect "side effect" end )
      :ok

  """
  @spec repeatedly(integer(), (() -> term())) :: :ok
  def repeatedly(0, _) do
    :ok
  end

  def repeatedly(n, f) do
    f.()
    repeatedly(n - 1, f)
  end
end
