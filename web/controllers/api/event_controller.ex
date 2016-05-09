defmodule Noise.Api.EventController do
  use Noise.Web, :controller

  alias Noise.Event

  plug :scrub_params, "event" when action in [:create]

  def create(conn, %{"event" => event_params}) do
    changeset = Event.changeset(%Event{}, event_params)

    case Repo.insert(changeset) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", event_path(conn, :show, event))
        |> render(Noise.Api.EventView, "show.json", event: event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Noise.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
		case Repo.get(Event, id) do
			nil ->
				conn
				|> put_status(:not_found)
				|> render(Noise.ErrorView, "404.json")
			event -> render(conn, "show.json", event: event)
		end
  end
end
