defmodule PuBot.Discord.BotCommands do
  alias Nostrum.Api
  alias Nostrum.Struct.Interaction

  def commands do
    [
      %{
        name: "hello",
        description: "I say hello back",
        options: []
      },
      %{
        name: "goodbye",
        description: "I say goodbye back",
        options: []
      }
    ]
  end

  def register_commands(guild_id) do
    Enum.each(commands(), fn c -> register_command(c, guild_id) end)
  end

  def register_command(command, guild_id) do
    Api.create_guild_application_command(guild_id, command)
  end

  def hello_respond(%Interaction{data: %{name: "hello"}} = interaction) do
    response = %{
      # ChannelMessageWithSource
      type: 4,
      data: %{
        content: "hello!"
      }
    }

    Api.create_interaction_response(interaction, response)
  end

  def goodbye_respond(%Interaction{data: %{name: "goodbye"}} = interaction) do
    response = %{
      # ChannelMessageWithSource
      type: 4,
      data: %{
        content: "goodbye!"
      }
    }

    Api.create_interaction_response(interaction, response)
  end
end
