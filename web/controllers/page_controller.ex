defmodule Noise.PageController do
  use Noise.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
