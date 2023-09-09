defmodule Mix.Tasks.ParseMixLock do
  @moduledoc "Parses the passed in mix.lock file"
  use Mix.Task

  @shortdoc "Parse the given mix.lock file"
  def run([]) do
    IO.puts("Please pass the path to a mix.exs file")
    System.stop(1)
  end

  def run([mix_lock_path]) do
    deps = MixLockParser.read_mix_lock!(mix_lock_path)
    IO.puts("#{mix_lock_path}:")
    IO.inspect(deps, limit: :infinity)
  end

  def run(_) do
    IO.puts("Too many files passed, only a single file at a time is allowed.")
    System.stop(1)
  end
end
