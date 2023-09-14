defmodule MixLockParserTest do
  use ExUnit.Case
  use Mneme

  doctest MixLockParser

  test "raises an exception when the file cannot be found" do
    assert_raise File.Error, ~r/no such file or directory/, fn ->
      MixLockParser.read_mix_lock!("non-existant-file")
    end
  end

  test "parses mix lock files" do
    dir = Path.join([:code.priv_dir(:mix_lock_parser), "sample_lockfiles"])

    file_names =
      auto_assert [
                    "dash_mix.lock",
                    "default_phoenix_mix.lock",
                    "exsync_mix.lock",
                    "publicsuffix_mix.lock",
                    "short_mix.lock"
                  ] <- File.ls!(dir) |> Enum.sort()

    auto_assert %{
                  "dash_mix.lock" => [
                    {:beam_notify, :hex, "1.1.0"},
                    {:castore, :hex, "1.0.3"},
                    {:connection, :hex, "1.1.0"},
                    {:contex, :hex, "0.5.0"},
                    {:crontab, :hex, "1.1.13"},
                    {:data_tracer, :hex, "0.1.0"},
                    {:db_connection, :hex, "2.5.0"},
                    {:decimal, :hex, "2.1.1"},
                    {:dotenv_parser, :hex, "2.0.0"},
                    {:ecto, :hex, "3.10.3"},
                    {:ecto_sql, :hex, "3.10.1"},
                    {:ecto_sqlite3, :hex, "0.10.3"},
                    {:elixir_make, :hex, "0.6.3"},
                    {:ex_image_info, :hex, "0.2.4"},
                    {:exqlite, :hex, "0.13.2"},
                    {:exsync, :hex, "0.3.0"},
                    {:file_system, :hex, "0.2.10"},
                    {:finch, :hex, "0.16.0"},
                    {:font_metrics, :hex, "0.5.1"},
                    {:freedom_formatter, :hex, "2.1.0"},
                    {:gen_stage, :hex, "1.2.1"},
                    {:gen_state_machine, :hex, "3.0.0"},
                    {:hpax, :hex, "0.1.2"},
                    {:input_event, :hex, "1.3.0"},
                    {:jason, :hex, "1.4.1"},
                    {:mahaul, :hex, "0.3.0"},
                    {:matcha, :hex, "0.1.8"},
                    {:mime, :hex, "2.0.5"},
                    {:mint, :hex, "1.5.1"},
                    {:muontrap, :hex, "1.3.2"},
                    {:nimble_csv, :hex, "1.2.0"},
                    {:nimble_options, :hex, "0.4.0"},
                    {:nimble_parsec, :hex, "1.3.1"},
                    {:nimble_pool, :hex, "1.0.0"},
                    {:nimble_strftime, :hex, "0.1.1"},
                    {:phoenix_pubsub, :hex, "2.1.3"},
                    {:property_table, :hex, "0.2.3"},
                    {:quantum, :hex, "3.5.0"},
                    {:recon, :hex, "2.5.3"},
                    {:req, :hex, "0.3.11"},
                    {:scenic, :hex, "0.11.1"},
                    {:scenic_driver_local, :hex, "0.11.0"},
                    {:scenic_live_reload, :hex, "0.3.1"},
                    {:telemetry, :hex, "1.2.1"},
                    {:telemetry_registry, :hex, "0.3.1"},
                    {:truetype_metrics, :hex, "0.6.1"},
                    {:typed_struct, :hex, "0.3.0"},
                    {:vintage_net, :hex, "0.13.4"},
                    {:zoneinfo, :hex, "0.1.7"}
                  ],
                  "default_phoenix_mix.lock" => [
                    {:castore, :hex, "1.0.3"},
                    {:cowboy, :hex, "2.10.0"},
                    {:cowboy_telemetry, :hex, "0.4.0"},
                    {:cowlib, :hex, "2.12.1"},
                    {:esbuild, :hex, "0.7.1"},
                    {:expo, :hex, "0.4.1"},
                    {:file_system, :hex, "0.2.10"},
                    {:finch, :hex, "0.16.0"},
                    {:floki, :hex, "0.34.3"},
                    {:gettext, :hex, "0.23.1"},
                    {:hpax, :hex, "0.1.2"},
                    {:jason, :hex, "1.4.1"},
                    {:mime, :hex, "2.0.5"},
                    {:mint, :hex, "1.5.1"},
                    {:nimble_options, :hex, "1.0.2"},
                    {:nimble_pool, :hex, "1.0.0"},
                    {:phoenix, :hex, "1.7.7"},
                    {:phoenix_html, :hex, "3.3.2"},
                    {:phoenix_live_dashboard, :hex, "0.8.1"},
                    {:phoenix_live_reload, :hex, "1.4.1"},
                    {:phoenix_live_view, :hex, "0.19.5"},
                    {:phoenix_pubsub, :hex, "2.1.3"},
                    {:phoenix_template, :hex, "1.0.3"},
                    {:plug, :hex, "1.14.2"},
                    {:plug_cowboy, :hex, "2.6.1"},
                    {:plug_crypto, :hex, "1.2.5"},
                    {:ranch, :hex, "1.8.0"},
                    {:swoosh, :hex, "1.11.5"},
                    {:tailwind, :hex, "0.2.1"},
                    {:telemetry, :hex, "1.2.1"},
                    {:telemetry_metrics, :hex, "0.6.1"},
                    {:telemetry_poller, :hex, "1.0.0"},
                    {:websock, :hex, "0.5.3"},
                    {:websock_adapter, :hex, "0.5.4"}
                  ],
                  "exsync_mix.lock" => [
                    {:earmark, :hex, "1.3.2"},
                    {:ex_doc, :hex, "0.21.1"},
                    {:file_system, :hex, "0.2.7"},
                    {:makeup, :hex, "1.0.0"},
                    {:makeup_elixir, :hex, "0.14.0"},
                    {:nimble_parsec, :hex, "0.5.0"}
                  ],
                  "publicsuffix_mix.lock" => [
                    {:earmark, :hex, "0.2.1"},
                    {:ex_doc, :hex, "0.11.5"},
                    {:idna, :hex, "5.1.0"},
                    {:unicode_util_compat, :hex, "0.3.1"}
                  ],
                  "short_mix.lock" => [{:nimble_parsec, :hex, "1.3.1"}]
                } <-
                  Map.new(file_names, fn file_name ->
                    path = Path.join([dir, file_name])

                    parsed = MixLockParser.read_mix_lock!(path)
                    {file_name, parsed}
                  end)
  end
end
