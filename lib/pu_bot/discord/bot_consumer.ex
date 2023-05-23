defmodule PuBot.Discord.BotConsumer do
  use Nostrum.Consumer

  alias Nostrum.Struct.Interaction
  alias PuBot.Discord.BotCommands

  def handle_event(
        {:INTERACTION_CREATE, %Interaction{data: %{name: "hello"}} = interaction, _ws_state}
      ) do
    BotCommands.hello_respond(interaction)
  end

  def handle_event(
        {:INTERACTION_CREATE, %Interaction{data: %{name: "goodbye"}} = interaction, _ws_state}
      ) do
    BotCommands.goodbye_respond(interaction)
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
