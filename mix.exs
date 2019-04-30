defmodule KV.MixProject do
  use Mix.Project

  def project do
    [
      app: :kv,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:mongodb, :poolboy],
      extra_applications: [:logger],
      registered: [KV],
      mod: {KV, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:mongodb, ">= 0.0.0"},
     {:poolboy, ">= 0.0.0"}
    ]
  end
end
