defmodule PuBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :pu_bot,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      env: [guild_id: "", bot_token: ""]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nostrum, "~> 0.7"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:openskill, "~> 0.1.0"}
    ]
  end
end
