defmodule EvercamMedia.Mixfile do
  use Mix.Project

  def project do
    [app: :evercam_media,
     version: "1.0.#{DateTime.to_unix(DateTime.utc_now())}",
     elixir: "~> 1.9.1",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:phoenix] ++ Mix.compilers,
     aliases: aliases(),
     deps: deps()]
  end

  defp aliases do
    [
      clean: ["clean"],
      swagger: ["phx.swagger.generate priv/static/swagger.json --router EvercamMediaWeb.Router --endpoint EvercamMediaWeb.Endpoint"]
    ]
  end

  def application do
    [mod: {EvercamMedia, []},
     applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: [:dotenv, :credo | app_list()]
  defp app_list(:test), do: [:dotenv | app_list()]
  defp app_list(_), do: app_list()
  defp app_list, do: [
    :calendar,
    :cf,
    :bcrypt_elixir,
    :con_cache,
    :connection,
    :cors_plug,
    :plug_cowboy,
    :ecto,
    :ecto_sql,
    :httpoison,
    :inets,
    :jsx,
    :phoenix_swoosh,
    :swoosh,
    :meck,
    :phoenix,
    :phoenix_ecto,
    :phoenix_html,
    :phoenix_pubsub,
    :porcelain,
    :postgrex,
    :quantum,
    :runtime_tools,
    :timex,
    :tzdata,
    :erlware_commons,
    :uuid,
    :xmerl,
    :html_sanitize_ex,
    :gen_stage,
    :ex_aws,
    :configparser_ex,
    :sweet_xml,
    :phoenix_swagger,
    :ex_json_schema,
    :nadia,
    :geoip,
    :poolboy,
    :evercam_models,
    :joken,
    :export,
    :jason
  ]

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:calendar, "~> 1.0.0", override: true},
      {:bcrypt_elixir, "~> 2.0"},
      {:con_cache, "~> 0.14.0", override: true},
      {:cors_plug, "~> 2.0"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.1.4", only: :dev},
      {:dotenv, "~> 3.0.0", only: [:dev, :test]},
      {:ecto, "~> 3.1.7"},
      {:ecto_sql, "~> 3.1.6"},
      {:distillery, github: "ijunaid8989/distillery"},
      {:httpoison, "~> 1.5"},
      {:jsx, "~> 2.10.0", override: true},
      {:swoosh, "~> 0.24.1", override: true},
      {:phoenix_swoosh, "~> 0.2"},
      {:nadia, "~> 0.5.0"},
      {:phoenix, "~> 1.4", override: true},
      {:phoenix_ecto, "~> 4.0.0"},
      {:phoenix_html, "~> 2.13.3"},
      {:porcelain, "~> 2.0.3"},
      {:postgrex, "~> 0.15.1"},
      {:quantum, "~> 2.3"},
      {:timex, "~> 3.6.1"},
      {:tzdata, "1.0.2", override: true},
      {:uuid, "~> 1.1.7"},
      {:relx, "~> 3.27"},
      {:erlware_commons, "~> 1.3.0"},
      {:cf, "~> 0.3.1", override: true},
      {:exvcr, "~> 0.11.0", only: :test},
      {:meck,  "~> 0.8.4", override: :true},
      {:html_sanitize_ex, "~> 1.3.0"},
      {:gen_stage, "~> 0.14"},
      {:jason, "~> 1.1"},
      {:ex_aws, "~> 1.1.5"},
      {:configparser_ex, "~> 0.2.1"},
      {:sweet_xml, "~> 0.6", optional: true},
      {:phoenix_swagger, github: "xerions/phoenix_swagger"},
      {:ex_json_schema, "~> 0.7.1"},
      {:geoip, "~> 0.2"},
      {:poolboy, "~> 1.5.1"},
      {:evercam_models, github: "evercam/evercam_models"},
      {:joken, "~> 2.0"},
      {:export, "~> 0.1.0"},
    ]
  end
end
