defmodule Utilities.String do
  def is_uuid(venue_id) when is_binary(venue_id) do
    ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/
    |> Regex.match?(venue_id)
  end

  def is_uuid(_), do: false
end
