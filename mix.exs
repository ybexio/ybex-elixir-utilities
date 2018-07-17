defmodule Utilities.MixProject do
  use Mix.Project

  def project do
    [
      app: :utilities,
      version: "0.0.5",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:inflex, "~> 1.10.0"}
    ]
  end
end
