defmodule Noise.PageController do
  use Noise.Web, :controller

  def index(conn, _params) do
    Noise.Endpoint.broadcast! "events:volume", "new_value", %{value: :random.uniform}
    render conn, "index.html"
  end
end
