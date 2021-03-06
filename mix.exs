defmodule MSPP.Mixfile do
  use Mix.Project

  def project do
    [app: :mspp,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.detail": :test,
       "coveralls.post": :test
     ],
     test_coverage: [tool: ExCoveralls]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ranch],
     mod: {MSPP, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:dogma, "~> 0.0.10", only: :dev},
      # optional dependency for ex_doc for Markdown support
      {:earmark, "~> 0.1.18", only: :dev},
      {:ex_doc, "~> 0.10.0", only: :dev},
      {:excoveralls, "~> 0.4.0", only: :test},
      {:inch_ex, "~> 0.4.0", only: :docs},
      {:ranch, "~> 1.1"}
    ]
  end
end
