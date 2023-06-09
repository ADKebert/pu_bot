defmodule PuBot.Discord.Supervisor do
  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [PuBot.Discord.BotConsumer]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
