defmodule Noise.PageController do
  use Noise.Web, :controller

  def index(conn, _params) do
    label = ["temparatur", "lautstärke"]
    Noise.Endpoint.broadcast! "events", "new_value", %{label: Enum.random(label), value: :random.uniform}
    render conn, "index.html"
  end
end
