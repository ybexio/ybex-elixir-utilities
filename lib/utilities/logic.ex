defmodule Utilities.Logic do
  @moduledoc """
  Logic Control helper
  """

  @doc """
  """
  def cond_transform(result, []) do
    result
  end

  def cond_transform(result, [{bool, transformer} | rest_pairs]) do
    new_result = if bool, do: transformer.(result), else: result
    cond_transform(new_result, rest_pairs)
  end
end
