defmodule Noise.Event do
  use Noise.Web, :model

  schema "events" do
    field :label, :string
    field :value, :float

    timestamps [inserted_at: :timestamp, updated_at: false]
  end

  @required_fields ~w(label value)
  @optional_fields ~w(timestamp)

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
