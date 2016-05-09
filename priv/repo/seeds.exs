# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Noise.Repo.insert!(%Noise.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

maximum_value = 20

Noise.Repo.delete_all Noise.Event

for i <- 1..100 do
  value = maximum_value * :random.uniform
  Noise.Repo.insert %Noise.Event{label: "Volume", value: value, timestamp: Ecto.DateTime.utc}
end
