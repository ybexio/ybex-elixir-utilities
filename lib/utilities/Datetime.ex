defmodule Utilities.Datetime do
  @doc """
  Parse hh:mm:ss.sss to hh:mm

  ## Examples

      iex> Utilities.Datetime.tohhmm("17:30:00.000000")
      "17:30"

  """
  def to_hhmm(<<hh::bytes-size(2)>> <> ":" <> <<mm::bytes-size(2)>> <> ":" <> _rest) do
    "#{hh}:#{mm}"
  end

  def to_hhmm(%{hour: hour, minute: minute}) do
    hh = hour |> to_string |> String.pad_leading(2, "0")
    mm = minute |> to_string |> String.pad_leading(2, "0")
    "#{hh}:#{mm}"
  end

  def to_hhmm(_), do: nil
end
