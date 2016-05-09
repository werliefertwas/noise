defmodule Noise.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :label, :string
      add :value, :float
      add :timestamp, :datetime
    end

  end
end
