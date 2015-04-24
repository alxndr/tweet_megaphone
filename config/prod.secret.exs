use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :tweet_megaphone, TweetMegaphone.Endpoint,
  secret_key_base: "M+zRZ/XNSECeFmUHBkMOLlHsZB+lgSIp0tvuBak4RTvRLuT5NaZkKsP+8c5g2uDd"

# Configure your database
config :tweet_megaphone, TweetMegaphone.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tweet_megaphone_prod"
