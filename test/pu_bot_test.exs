defmodule PuBotTest do
  use ExUnit.Case
  doctest PuBot

  test "greets the world" do
    assert PuBot.hello() == :world
  end
end
