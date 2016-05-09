defmodule Noise.EventTest do
  use Noise.ModelCase

  alias Noise.Event

  @valid_attrs %{label: "some content", timestamp: "2010-04-17 14:00:00", value: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
