import Config

config :pu_bot, :guild_id, System.fetch_env!("PUBOT_GUILD_ID")
config :pu_bot, :bot_token, System.fetch_env!("PUBOT_TOKEN")