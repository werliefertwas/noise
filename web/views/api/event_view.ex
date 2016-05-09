defmodule Noise.Api.EventView do
  use Noise.Web, :view

  def render("show.json", %{event: event}) do
    %{event: render_one(event, Noise.Api.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id, label: event.label, value: event.value, timestamp: event.timestamp}
  end
end
