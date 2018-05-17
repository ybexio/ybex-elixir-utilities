defmodule Utilities.DatetimeTest do
  use ExUnit.Case

  alias Utilities.Datetime

  @moduletag :utilities

  test "to_hhmm should return hh:mm format" do
    hhmm = "17:30:00.000000" |> Datetime.to_hhmm()
    assert hhmm == "17:30"
  end

  test "to_hhmm should return hh:mm format for timex instance with leading pad" do
    hhmm = %{hour: 9, minute: 1} |> Datetime.to_hhmm()
    assert hhmm == "09:01"
  end

  test "to_hhmm should return hh:mm format for timex instance without leading pad" do
    hhmm = %{hour: 19, minute: 51} |> Datetime.to_hhmm()
    assert hhmm == "19:51"
  end

  test "to_hhmm should return nil if there is invalid input" do
    hhmm = "17:30.123" |> Datetime.to_hhmm()
    assert hhmm == nil
  end
end
