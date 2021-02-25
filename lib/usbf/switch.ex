defmodule Usbf.Switch do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [%{}])
  end

  def list_connections() do
    GenServer.call(__MODULE__, :connections)
  end

  @impl true
  def init(state) do
    IO.inspect(state, label: "Initial State")
    {:ok, state}
  end

  @impl true
  def handle_call(:connections, _from, state) do
    {:reply, state[:connections], state}
  end

  defp list_local_ports() do
  end

  defp open_source(), do: nil
  defp open_sink(), do: nil
  defp connect(_source, _sink), do: nil
end
