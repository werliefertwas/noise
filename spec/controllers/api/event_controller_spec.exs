defmodule Noise.Api.EventControllerSpec do
	use ESpec.Phoenix, controller: Noise.Api.EventController
  alias Noise.Event

  @valid_attrs %{"label" => "temperatur", "value" => 20.4}
  @invalid_attrs %{}

	describe "show" do
		let :event, do: %Event{id: 1, label: "new label", value: 20.5}

		before do
			allow(Repo).to accept(:get, fn
				Event, 1 -> event
				Event, id -> passthrough([Event, id])
			end)
		end

		subject do: action(:show, %{"id" => id})

		context "when event exists" do
			let :id, do: 1

			it do: should be_successful
			it do: should render_template("show.json")
			it do: should have_in_assigns(event: event)
		end

		context "when event does not exists" do
			let :id, do: 2

			it do: should be_not_found
			it do: should render_template("404.json")
		end
	end

	describe "create" do
		subject do: action(:create, %{"event" => attrs})

		context "when event attributes are valid" do
			let :attrs, do: %{"label" => "my label", "value" => 21.1}

		  it do: should be_successful
		  it do: should render_template("show.json")
			it do: subject.assigns.event.label |> should(eq("my label"))
			it do: subject.assigns.event.value |> should(eq(21.1))
			# it do: subject.assigns.event.timestamp |> should(is_a(Ecto.DateTime))
		end

		context "when event attributes are not valid" do
			let :attrs, do: %{}

		  it do: should have_http_status 422
		  it do: should render_template("error.json")
	  end
	end
end
