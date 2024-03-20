defmodule KinoSmartcellTemplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_smartcell_template,
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
      mod: {KinoSmartcellTemplate.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Defaults to latest version of Kino, but you should pin a version here instead for reproducability
      {:kino, ">= 0.0.0"}
    ]
  end
end
