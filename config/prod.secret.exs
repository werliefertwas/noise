use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :noise, Noise.Endpoint,
  secret_key_base: "SRbSIpTBfWyb1B88xqd3sYAnsaHlOaxJg5FrdjnYsJPBFvbw3KAar5xopPPnZJeq"

# Configure your database
config :noise, Noise.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "noise_prod",
  pool_size: 20
