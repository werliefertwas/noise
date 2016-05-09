ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Noise.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Noise.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Noise.Repo)

