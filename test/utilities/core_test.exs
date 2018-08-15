defmodule Utilities.CoreTest do
  use ExUnit.Case
  doctest Utilities.Core

  alias Utilities.Core

  @moduletag :utilities

  def assert

  defmodule PingCounter do
    def loop(num_of_time_received \\ 0) do
      receive do
        :ping ->
          loop(num_of_time_received + 1)

        {:total, pid} ->
          send(pid, {:pong, num_of_time_received})
          loop(num_of_time_received + 1)
      end
    end
  end

  describe "&repeatedly/2" do
    setup do
      ping_counter = spawn(PingCounter, :loop, [])

      send_ping = fn ->
        send(ping_counter, :ping)
      end

      {:ok, send_ping: send_ping, ping_counter: ping_counter}
    end

    test "apply the functions provied n time", %{send_ping: send_ping, ping_counter: ping_counter} do
      num_ping = 5
      assert Core.repeatedly(num_ping, send_ping) == :ok
      send(ping_counter, {:total, self()})

      :timer.sleep(1)
      assert_received {:pong, num_ping}
    end

    test "apply the functions 0 time", %{send_ping: send_ping, ping_counter: ping_counter} do
      assert Core.repeatedly(0, send_ping) == :ok
      send(ping_counter, {:total, self()})

      :timer.sleep(1)
      assert_received {:pong, 0}
    end
  end
end
