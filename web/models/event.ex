defmodule Noise.Event do
  use Noise.Web, :model

  schema "events" do
    field :label, :string
    field :value, :float
    field :timestamp, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(label value timestamp)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
