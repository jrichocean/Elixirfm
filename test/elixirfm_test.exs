defmodule ElixirfmTest do
  use ExUnit.Case
  doctest Elixirfm

  test "_encode_params/1 encodes types correctly" do
    import Elixirfm, only: [_encode_params: 1]
    assert _encode_params([{"testkey", "testval"}]) == ["&testkey=testval"]
    assert _encode_params(%{"testkey" => "testval"}) == ["&testkey=testval"]
    assert _encode_params(%{testkey: "testval"}) == ["&testkey=testval"]
    assert _encode_params([testkey: "testval"]) == ["&testkey=testval"]
  end
end
