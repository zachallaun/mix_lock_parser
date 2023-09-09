defmodule SimpleTest do
  use ExUnit.Case
  use Mneme

  test "map test" do
    auto_assert %{a: 1, b: 2, c: 3, d: 4} <- return_a_map!()
  end

  # NOTE: This would typically be in your main application
  def return_a_map! do
    %{a: 1, b: 2, c: 3, d: 4}
  end
end
