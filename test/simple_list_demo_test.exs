defmodule SimpleListDemoTest do
  use ExUnit.Case
  doctest SimpleListDemo

  test "greets the world" do
    assert SimpleListDemo.hello() == :world
  end
end
