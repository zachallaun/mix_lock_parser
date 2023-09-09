defmodule MixLockParser do
  require Logger
  alias MixLockParser.ExsLoader

  def read_mix_lock!(path) do
    {:ok, data} =
      File.read!(path)
      |> safe_eval()

    parse_mix_lock_contents(data)
    |> Enum.sort()
  end

  def parse_mix_lock_contents(data) when is_map(data) do
    Enum.flat_map(data, fn
      {dep, {:hex, _dep, version, _hash, _build_tool, _deps, "hexpm", _other_hash}} ->
        [{dep, :hex, version}]

      # Older format
      {dep, {:hex, _dep, version, _hash, _build_tool, _deps, "hexpm"}} ->
        [{dep, :hex, version}]

      {dep, {:git, _dep, _version, _}} ->
        Logger.debug("Ignoring #{dep} because it is a git dep")
        []

      {dep, details} ->
        Logger.warning("Ignoring #{dep}: #{inspect(details)}")
        []

      _ ->
        Logger.warning("Unrecognized mix.lock format")
        []
    end)
  end

  def safe_eval(contents) do
    ExsLoader.parse(contents, "mix.lock", false, true)
  end
end
