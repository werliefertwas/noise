defmodule Noise.EventSpec do
  use ESpec.Phoenix, model: Noise.Event
  alias Noise.Event

  describe "changeset" do
    subject do: Event.changeset(%Event{}, attrs)

    context "valid changeset" do
      let :attrs, do: %{label: "temperature", value: 0.5, timestamp: Ecto.DateTime.utc}
      it do: should be_valid
    end
  end
end
