defmodule Noise.EventChannel do
  use Phoenix.Channel

  def join(_event, _message, socket) do
    {:ok, socket}
  end
end
